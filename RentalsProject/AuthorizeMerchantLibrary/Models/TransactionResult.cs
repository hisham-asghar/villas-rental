using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AuthorizeMerchantLibrary.Models
{
    public enum ResultType
    {
        OK,ERROR    
    }

    public class TransactionResult
    {
        public string response { get; set; }
        public ResultType result { get; set; }
    }
    public class SuccessTransactionResult : TransactionResult
    {
        public string TranscationId { get; set; }
        public int ResponseCode { get; set; }
        public string MessageCode { get; set; }
        public string Description { get; set; }
        public string SuccessAuthCode { get; set; }
    }
    public class FailedTransactionResult : TransactionResult
    {
        public int ResponseCode { get; set; }
        public string MessageCode { get; set; }
    }
}
