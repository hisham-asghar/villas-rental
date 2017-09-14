﻿using System;
 using AuthorizeMerchantLibrary.Models;
 using AuthorizeNet.Api.Controllers;
using AuthorizeNet.Api.Contracts.V1;
using AuthorizeNet.Api.Controllers.Bases;

namespace AuthorizeMerchantLibrary
{
    public class ChargeCreditCard
    {
        public static TransactionResult Run(TransactionMeta transMeta, BillingAddress address, CreditCard billingCard, VillaTransactionSlip slip)
        {
            Console.WriteLine("Charge Credit Card Sample");

            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;

            // define the merchant information (authentication / transaction id)
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = transMeta.ApiLoginID,
                ItemElementName = ItemChoiceType.transactionKey,
                Item = transMeta.ApiTransactionKey
            };

            var creditCard = new creditCardType
            {
                cardNumber = billingCard.cardNumber,
                expirationDate = billingCard.expirationDate,
                cardCode = billingCard.cardCode
            };

            var billingAddress = new customerAddressType
            {
                firstName = address.firstName,
                lastName = address.lastName,
                address = address.address,
                city = address.city,
                zip = address.zip,
                country = address.country,
                email = address.email,
                phoneNumber = address.phoneNumber,
                state = address.state
            };

            //standard api call to retrieve response
            var paymentType = new paymentType { Item = creditCard };

            var amount = new Decimal(slip.TotalPriceWithTaxTransaction);
            amount = new decimal(5.00);

            var transactionRequest = new transactionRequestType
            {
                transactionType = transactionTypeEnum.authCaptureTransaction.ToString(),    // charge the card
                amount = amount,
                payment = paymentType,
                billTo = billingAddress
            };

            var request = new createTransactionRequest { transactionRequest = transactionRequest };

            // instantiate the contoller that will call the service
            var controller = new createTransactionController(request);
            controller.Execute();

            // get the response from the service (errors contained if any)
            var response = controller.GetApiResponse();



            //validate
            return ResultHelper.ParseTransactionResult(response);
        }
    }
}
