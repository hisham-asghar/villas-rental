namespace RentalsClinet.Helpers
{
    public class SendEmailModel
    {
        public string To { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
    }
    public class VerificationEmailModel
    {
        public string To { get; set; }
        public string Subject { get; set; }
        public string Link { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public string ServerPath { get; set; }
        public string Type { get; set; }
    }
}