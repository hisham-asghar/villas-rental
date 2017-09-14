using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using AuthorizeMerchantLibrary.Models;
using AuthorizeNet.Api.Contracts.V1;
using AuthorizeNet.Api.Controllers;
using AuthorizeNet.Api.Controllers.Bases;

namespace RentalHelper.Helper
{
    public class MerchantHelper
    {
        public static TransactionMeta GetTransactionMeta()
        {
            return new TransactionMeta()
            {
                ApiLoginID = "7u69CLq5Q",
                ApiTransactionKey = "59P6h2n746cD7cG9"
            };
        }

        public static TransactionResult ChargeCreditCardHelper(BillingAddress address, CreditCard card,
            VillaTransactionSlip slip)
        {
            ServicePointManager.SecurityProtocol = (SecurityProtocolType) 3072;
            return ChargeCreditCardHelperRun(GetTransactionMeta(), address, card, slip);
        }

        public static TransactionResult ChargeCreditCardHelperRunDump()
        {
            Console.WriteLine("Charge Credit Card Sample");

            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.SANDBOX;

            // define the merchant information (authentication / transaction id)
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = "5KP3u95bQpv",
                ItemElementName = ItemChoiceType.transactionKey,
                Item = "346HZ32z3fP4hTG2",
            };

            var creditCard = new creditCardType
            {
                cardNumber = "4111111111111111",
                expirationDate = "0718",
                cardCode = "123"
            };

            var billingAddress = new customerAddressType
            {
                firstName = "John",
                lastName = "Doe",
                address = "123 My St",
                city = "OurTown",
                zip = "98004"
            };

            //standard api call to retrieve response
            var paymentType = new paymentType { Item = creditCard };

            // Add line Items
            var lineItems = new lineItemType[2];
            lineItems[0] = new lineItemType { itemId = "1", name = "t-shirt", quantity = 2, unitPrice = new Decimal(15.00) };
            lineItems[1] = new lineItemType { itemId = "2", name = "snowboard", quantity = 1, unitPrice = new Decimal(450.00) };

            var transactionRequest = new transactionRequestType
            {
                transactionType = transactionTypeEnum.authCaptureTransaction.ToString(),    // charge the card

                amount = new decimal(15.00),
                payment = paymentType,
                billTo = billingAddress,
                lineItems = lineItems
            };

            var request = new createTransactionRequest { transactionRequest = transactionRequest };

            // instantiate the contoller that will call the service
            var controller = new createTransactionController(request);
            controller.Execute();

            // get the response from the service (errors contained if any)
            var response = controller.GetApiResponse();



            //validate
            if (response == null)
                return new TransactionResult()
                {
                    response = "NULL",
                    result = ResultType.ERROR
                };
            if (response.messages.resultCode == messageTypeEnum.Ok)
            {
                if (response.transactionResponse.messages != null)
                {
                    return new SuccessTransactionResult()
                    {
                        result = ResultType.OK,
                        Description = response.transactionResponse.messages[0].description,
                        MessageCode = response.transactionResponse.messages[0].code,
                        ResponseCode = response.transactionResponse.responseCode,
                        SuccessAuthCode = response.transactionResponse.authCode,
                        TranscationId = response.transactionResponse.transId,
                        response = "Success"
                    };
                }
                if (response.transactionResponse.errors != null)
                    return new FailedTransactionResult()
                    {
                        result = ResultType.ERROR,
                        MessageCode = response.transactionResponse.errors[0].errorText,
                        ResponseCode = response.transactionResponse.errors[0].errorCode,
                        response = "Failed"
                    };
                return new TransactionResult()
                {
                    response = "NULL",
                    result = ResultType.ERROR
                };
            }
            if (response.transactionResponse != null && response.transactionResponse.errors != null)
            {
                return new FailedTransactionResult()
                {
                    result = ResultType.ERROR,
                    MessageCode = response.transactionResponse.errors[0].errorText,
                    ResponseCode = response.transactionResponse.errors[0].errorCode,
                    response = "Failed"
                };
            }
            return new FailedTransactionResult()
            {
                result = ResultType.ERROR,
                MessageCode = response.messages.message[0].text,
                ResponseCode = response.messages.message[0].code,
                response = "Transaction Failed"
            };
        }
    

        public static TransactionResult ChargeCreditCardHelperRun(TransactionMeta transMeta, BillingAddress address, CreditCard billingCard, VillaTransactionSlip slip)
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

            // Add line Items
            /*            var lineItems = new lineItemType[1];
                        lineItems[0] = new lineItemType { itemId = "1", name = "Villa", description = slip.villa, quantity = slip.days, unitPrice = new decimal(5.00) };
                        lineItems[1] = new lineItemType { itemId = "2", name = "Security", quantity = 1, unitPrice = new Decimal(slip.securityCharges) };
                        lineItems[2] = new lineItemType { itemId = "3", name = "Cleaning", quantity = 1, unitPrice = new Decimal(slip.cleaningCharges) };
                        lineItems[2] = new lineItemType { itemId = "4", name = "ExtraGuest", quantity = slip.extraGuestCount, unitPrice = new Decimal(slip.extraGuestCharges) };*/
            var lineItems = new lineItemType[2];
            lineItems[0] = new lineItemType { itemId = "1", name = "t-shirt", quantity = 2, unitPrice = new Decimal(15.00) };
            lineItems[1] = new lineItemType { itemId = "2", name = "snowboard", quantity = 1, unitPrice = new Decimal(450.00) };

            var amount = new Decimal(((slip.villaPerDayPrice * slip.days) + slip.securityCharges + slip.cleaningCharges +
                          (slip.extraGuestCharges * slip.extraGuestCount)) * 1.29);
            amount = new decimal(5.00);

            var transactionRequest = new transactionRequestType
            {
                transactionType = transactionTypeEnum.authCaptureTransaction.ToString(),    // charge the card

                amount = amount,
                payment = paymentType,
                billTo = billingAddress,
                lineItems = lineItems
            };

            var request = new createTransactionRequest { transactionRequest = transactionRequest };

            // instantiate the contoller that will call the service
            var controller = new createTransactionController(request);
            controller.Execute();

            // get the response from the service (errors contained if any)
            var response = controller.GetApiResponse();



            //validate
            if (response == null)
                return new TransactionResult()
                {
                    response = "NULL",
                    result = ResultType.ERROR
                };
            if (response.messages.resultCode == messageTypeEnum.Ok)
            {
                if (response.transactionResponse.messages != null)
                {
                    return new SuccessTransactionResult()
                    {
                        result = ResultType.OK,
                        Description = response.transactionResponse.messages[0].description,
                        MessageCode = response.transactionResponse.messages[0].code,
                        ResponseCode = response.transactionResponse.responseCode,
                        SuccessAuthCode = response.transactionResponse.authCode,
                        TranscationId = response.transactionResponse.transId,
                        response = "Success"
                    };
                }
                if (response.transactionResponse.errors != null)
                    return new FailedTransactionResult()
                    {
                        result = ResultType.ERROR,
                        MessageCode = response.transactionResponse.errors[0].errorText,
                        ResponseCode = response.transactionResponse.errors[0].errorCode,
                        response = "Failed"
                    };
                return new TransactionResult()
                {
                    response = "NULL",
                    result = ResultType.ERROR
                };
            }
            if (response.transactionResponse != null && response.transactionResponse.errors != null)
            {
                return new FailedTransactionResult()
                {
                    result = ResultType.ERROR,
                    MessageCode = response.transactionResponse.errors[0].errorText,
                    ResponseCode = response.transactionResponse.errors[0].errorCode,
                    response = "Failed"
                };
            }
            return new FailedTransactionResult()
            {
                result = ResultType.ERROR,
                MessageCode = response.messages.message[0].text,
                ResponseCode = response.messages.message[0].code,
                response = "Transaction Failed"
            };
        }
    }
}