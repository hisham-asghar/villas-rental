using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Configuration;
using System.Net.Mail;
using System.Text;
using CustomModels.Cars;
using CustomModels.Yachts;
using Newtonsoft.Json;
using RentalHelper.Helper;
using SendGrid;

namespace RentalsClinet.Helpers
{
    public static class EmailHelper
    {
        public static bool InquiryYachts(UserReuqestYacht model, string serverPath)
        {
            var str = "FirstName: " + model.firstname + "<br/>";
            str += "LastName: " + model.lastname + "<br/>";
            str += "Email: " + model.email + "<br/>";
            str += "Budget: " + model.budget + "<br/>";
            str += "Guests: " + model.guests + "<br/>";
            str += "Check In Date: " + model.date + "<br/>";
            str += "Charter Type: " + model.type + "<br/>";
            str += "Phone: " + model.tel + "<br/>";
            str += "Yacht: <a href='" + model.link + "'>Click to View Yacht</a><br/>";
            str += "Message: " + model.message + "<br/>";
            return ReservationEmail("Yacht", str, serverPath);
        }
        public static bool InquiryCars(UserReuqestCar model, string serverPath)
        {
            var str = "FirstName: " + model.firstname + "<br/>";
            str += "LastName: " + model.lastname + "<br/>";
            str += "Email: " + model.email + "<br/>";
            str += "Budget: " + model.budget + "<br/>";
            str += "Check In Date: " + model.date + "<br/>";
            str += "Phone: " + model.tel + "<br/>";
            str += "Car: <a href='" + model.link + "'>Click to View Car</a><br/>";
            str += "Message: " + model.message + "<br/>";
            return ReservationEmail("Car", str, serverPath);
        }


        public static bool ReservationEmail(string type, string body, string serverPath)
        {

            var jsonFileReader = new StreamReader(serverPath + "/data.json");
            var json = jsonFileReader.ReadToEnd();
            var obj = JsonConvert.DeserializeObject<List<KeyValuePair<string, string>>>(json);
            try
            {
                const string emailOfc = "ReservationEmail";
                var reservationEmail =
                    obj.Where(s => s.Key.ToLower().Trim() == emailOfc.ToLower().Trim())
                        .Select(s => s.Value)
                        .FirstOrDefault();
                var model = new SendEmailModel
                {
                    To = reservationEmail,
                    Subject = type + " reservations from themarucagroup.com",
                    Body = body
                };
                return (bool)SendMail(model);
            }
            catch (Exception e)
            {
                return false;
            }

        }

        public static object SendMail(SendEmailModel model)
        {
            var smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");

            
            var htmlView = AlternateView.CreateAlternateViewFromString(model.Body);
            htmlView.ContentType = new System.Net.Mime.ContentType("text/html");

            var mail = new MailMessage
            {
                From = new MailAddress(smtpSection.From),
                IsBodyHtml = true,
                Subject = model.Subject,
                Body = model.Body
            };
            //mail.AlternateViews.Add(htmlView);
            mail.To.Add(new MailAddress(model.To));

            var smtp = new SmtpClient();            
            smtp.Port = smtpSection.Network.Port;
            smtp.EnableSsl = smtpSection.Network.EnableSsl;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Host = smtpSection.Network.Host;
            smtp.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
            smtp.Credentials = new NetworkCredential(mail.From.ToString(), smtpSection.Network.Password);
            //smtp.Send(mail);
            model.To = CustomActions.getEmailLocation();
            var mailDTO = new LayerDB.Mail(){
                MailTo = model.To,
                Status = false,
                Subject = model.Subject,
                Text = model.Body,
                guid = Guid.NewGuid().ToString()
            };
            LayerDAO.MailDAO.Save(mailDTO);
            var location = Helpers.CustomActions.getGodaddyEmailLocation();
            string line;
            var request = WebRequest.Create(location + "/Mails/Send?guid="+mailDTO.guid) as HttpWebRequest;
            var response = request.GetResponse() as HttpWebResponse;
            var streamr = new StreamReader(response.GetResponseStream());
            line = streamr.ReadToEnd();
            if (string.IsNullOrWhiteSpace(line))
                return false;
            if (line != "1")
                return false;
            return true;
        }

        public static bool SendMail_SendGrid(SendEmailModel model)
        {
            var myMessage = new SendGridMessage();
            myMessage.AddTo(model.To);
            myMessage.From = new MailAddress("do-not-reply@themarucagroup.com", "The Maruca Group");
            myMessage.Subject = model.Subject;
            
            myMessage.Text = model.Body;//.Replace("<br/>", Environment.NewLine).Replace("<br />", Environment.NewLine);

            // Create credentials, specifying your user name and password.
            var credentials = new NetworkCredential("themaruagroup", "BetterlaterthanNever2017!");
            
            // Create an Web transport for sending email.
            var transportWeb = new Web(credentials);

            // Send the email.
            transportWeb.Deliver(myMessage);

            return true;
        }

        public static bool InquiryWork(CustomModels.WorkModel model,string serverPath)
        {
            var str = "Name: " + model.name + "<br/>";
            str += "Email: " + model.email + "<br/>";
            str += "Speciality: " + model.speciality + "<br/>";
            str += "Message: " + model.message + "<br/>";
            
            var jsonFileReader = new StreamReader(serverPath + "/data.json");
            var json = jsonFileReader.ReadToEnd();
            var obj = JsonConvert.DeserializeObject<List<KeyValuePair<string, string>>>(json);
            try
            {
                const string emailOfc = "ReservationEmail";
                var reservationEmail =
                    obj.Where(s => s.Key.ToLower().Trim() == emailOfc.ToLower().Trim())
                        .Select(s => s.Value)
                        .FirstOrDefault();

                var cmodel = new SendEmailModel
                {
                    To = reservationEmail,
                    Subject = "Request for Work with themarucagroup.com",
                    Body = str
                };
                return (bool)SendMail(cmodel);
            }
            catch (Exception e)
            {
                return false;
            }

        }
        public static bool InquiryContact(CustomModels.ContactModel model, string serverPath)
        {
            var str = "Name: " + model.name + "<br/>";
            str += "Email: " + model.email + "<br/>";
            str += "Phone: " + model.phone + "<br/>";
            str += "Message: " + model.message + "<br/>";


            var jsonFileReader = new StreamReader(serverPath + "/data.json");
            var json = jsonFileReader.ReadToEnd();
            var obj = JsonConvert.DeserializeObject<List<KeyValuePair<string, string>>>(json);
            try
            {
                const string emailOfc = "ReservationEmail";
                var reservationEmail =
                    obj.Where(s => s.Key.ToLower().Trim() == emailOfc.ToLower().Trim())
                        .Select(s => s.Value)
                        .FirstOrDefault();


                var cmodel = new SendEmailModel
                {
                    To = reservationEmail,
                    Subject = "Client Request from themarucagroup.com",
                    Body = str
                };
                return (bool)SendMail(cmodel);
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public static bool SendHomeOwnerMail(LayerDB.HomeOwner model)
        {

            var str = "Name and/or entity name: " + model.name + "<br/>";
            str += " Email: " + model.email + "<br/>";
            str += " Phone: " + model.phone + "<br/>";
            str += " Entity name: " + model.entityName + "<br/>";
            str += " Role: " + model.role + "<br/>";
            str += " Country: " + model.country + "<br/>";
            str += " City: " + model.city + "<br/>";
            str += " How did you hear about us: " + model.source + "<br/>";
            str += " Website or link to property photos: " + model.link + "<br/>";
            str += " Is this your primary residence ? " + model.primary_residence + "<br/>";
            str += " Message: " + model.message + "<br/>";

            var cmodel = new SendEmailModel
            {
                To = Helpers.CustomActions.getEmailLocation(),
                Subject = "Request for Work with themarucagroup.com",
                Body = str
            };
            return (bool)SendMail(cmodel);
        }
    }
}