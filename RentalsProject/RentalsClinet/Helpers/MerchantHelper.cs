using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AuthorizeMerchantLibrary;
using AuthorizeMerchantLibrary.Models;
using AuthorizeNet.Api.Contracts.V1;
using AuthorizeNet.Api.Controllers;
using AuthorizeNet.Api.Controllers.Bases;
using LayerDAO;

namespace RentalsClinet.Helpers
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

        public static TransactionResult GetTransactionRes(string line)
        {
            if (line == null) return null;
            try
            {
                return (SuccessTransactionResult) Newtonsoft.Json.JsonConvert.DeserializeObject(line,
                    typeof(SuccessTransactionResult));
            }
            catch (Exception e)
            {
                try
                {

                    return (FailedTransactionResult)Newtonsoft.Json.JsonConvert.DeserializeObject(line,
                        typeof(FailedTransactionResult));
                }catch(Exception ex)
                {
                    return (TransactionResult)Newtonsoft.Json.JsonConvert.DeserializeObject(line,
                        typeof(TransactionResult));
                }
            }
        }

        public static BookedResultJson getJsonResSuccess(SuccessTransactionResult result,int bookId)
        {
            var errorLine = "Could not Process the transaction";
            if (result == null || result.response == null)
                return new BookedResultJson
                {
                    flag = 2,
                    message = errorLine
                };

            if (result.result == ResultType.OK)
            {
                var success = (SuccessTransactionResult)result;
                if (success.ResponseCode == 1 || success.MessageCode != "1")
                    return new BookedResultJson()
                    {
                        flag = 0,
                        message = success.Description
                    };
                var resFlag = PropertyDAO.BookPropertyVerfied(bookId);
                return new BookedResultJson
                {
                    flag = 0,
                    message = success.Description
                };
            }


            return new BookedResultJson
            {
                flag = 2,
                message = errorLine
            };
        }

        public static BookedResultJson getJsonResFail(SuccessTransactionResult result,int bookId)
        {
            var errorLine = "Could not Process the transaction";
            if (result == null || result.response == null)
                return new BookedResultJson
                {
                    flag = 2,
                    message = errorLine
                };

            if (result.result == ResultType.OK)
            {
                var success = (SuccessTransactionResult)result;
                if (success.ResponseCode == 1 && success.MessageCode == "1")
                {
                    var resFlag = PropertyDAO.BookPropertyVerfied(bookId);
                    return new BookedResultJson
                    {
                        flag = 0,
                        message = success.Description
                    };
                }
            }

            return new BookedResultJson
            {
                flag = 2,
                message = errorLine
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

            ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
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
            /*
            // Add line Items
            var lineItems = new lineItemType[2];
            lineItems[0] = new lineItemType { itemId = "1", name = "t-shirt", quantity = 2, unitPrice = new Decimal(15.00) };
            lineItems[1] = new lineItemType { itemId = "2", name = "snowboard", quantity = 1, unitPrice = new Decimal(450.00) };
            */
            var transactionRequest = new transactionRequestType
            {
                transactionType = transactionTypeEnum.authCaptureTransaction.ToString(),    // charge the card

                amount = new decimal(15.00),
                payment = paymentType,
                billTo = billingAddress
            };

            var request = new createTransactionRequest { transactionRequest = transactionRequest };

            // instantiate the contoller that will call the service
            var controller = new createTransactionController(request);
            controller.Execute();

            // get the response from the service (errors contained if any)
            var response = controller.GetApiResponse();


            return ResultHelper.ParseTransactionResult(response);

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
            
            /*var lineItems = new lineItemType[2];
            lineItems[0] = new lineItemType { itemId = "1", name = "t-shirt", quantity = 2, unitPrice = new Decimal(15.00) };
            lineItems[1] = new lineItemType { itemId = "2", name = "snowboard", quantity = 1, unitPrice = new Decimal(450.00) };
            */
            var amount = new Decimal(slip.TotalPriceWithTaxTransaction);

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

            return ResultHelper.ParseTransactionResult(response);

            //validate
            
        }

    }

    public class BookedResultJson
    {
        public int flag { get; set; }
        public string message { get; set; }
    }
}