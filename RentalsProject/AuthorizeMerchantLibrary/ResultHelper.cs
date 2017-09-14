using System;
using AuthorizeMerchantLibrary.Models;
using AuthorizeNet.Api.Controllers;
using AuthorizeNet.Api.Contracts.V1;
using AuthorizeNet.Api.Controllers.Bases;

namespace AuthorizeMerchantLibrary
{
    public class ResultHelper
    {


        public static TransactionResult ParseTransactionResult(AuthorizeNet.Api.Contracts.V1.createTransactionResponse response)
        {
            if (response == null)
                return new TransactionResult()
                {
                    response = null,
                    result = ResultType.ERROR
                };
            if (response.messages.resultCode == messageTypeEnum.Ok)
            {
                if (response.transactionResponse.messages != null)
                {
                    var resopnseCode = 0;
                    int.TryParse(response.transactionResponse.responseCode, out resopnseCode);
                    return new SuccessTransactionResult()
                    {
                        result = ResultType.OK,
                        Description = response.transactionResponse.messages[0].description,
                        MessageCode = response.transactionResponse.messages[0].code,
                        ResponseCode = resopnseCode,
                        SuccessAuthCode = response.transactionResponse.authCode,
                        TranscationId = response.transactionResponse.transId,
                        response = "Success"
                    };
                }
                if (response.transactionResponse.errors != null)
                {

                    var resopnseCode = 0;
                    int.TryParse(response.transactionResponse.errors[0].errorCode, out resopnseCode);
                    return new FailedTransactionResult()
                    {
                        result = ResultType.ERROR,
                        MessageCode = response.transactionResponse.errors[0].errorText,
                        ResponseCode = resopnseCode,
                        response = "Failed"
                    };
                }
                return new TransactionResult()
                {
                    response = null,
                    result = ResultType.ERROR
                };
            }
            if (response.transactionResponse != null && response.transactionResponse.errors != null)
            {
                var resopnseCode = 0;
                int.TryParse(response.transactionResponse.errors[0].errorCode, out resopnseCode);
                return new FailedTransactionResult()
                {
                    result = ResultType.ERROR,
                    MessageCode = response.transactionResponse.errors[0].errorText,
                    ResponseCode = resopnseCode,
                    response = "Failed"
                };
            }
            var resopnseCodeE = 0;
            if (response.transactionResponse == null)
                return new FailedTransactionResult()
                {
                    result = ResultType.ERROR,
                    MessageCode = response.messages.message[0].text,
                    ResponseCode = resopnseCodeE,
                    response = "Transaction Failed"
                };

            if (response.transactionResponse.errors != null)
                int.TryParse(response.transactionResponse.errors[0].errorCode, out resopnseCodeE);
            return new FailedTransactionResult()
            {
                result = ResultType.ERROR,
                MessageCode = response.messages.message[0].text,
                ResponseCode = resopnseCodeE,
                response = "Transaction Failed"
            };
        }
    }
}
