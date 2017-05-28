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

namespace RentalsClinet.Helpers
{
    public static class EmailHelper
    {
        public static bool InquiryYachts(UserReuqestYacht model, string serverPath)
        {
            var str = "FirstName: <b>" + model.firstname + "</b><br/>";
            str += "LastName: <b>" + model.lastname + "</b><br/>";
            str += "Email: <b>" + model.email + "</b><br/>";
            str += "Budget: <b>" + model.budget + "</b><br/>";
            str += "Guests: <b>" + model.guests + "</b><br/>";
            str += "Check In Date: <b>" + model.date + "</b><br/>";
            str += "Charter Type: <b>" + model.type + "</b><br/>";
            str += "Phone: <b>" + model.tel + "</b><br/>";
            str += "Yacht: <a href='" + model.link + "'><b>Click to View Yacht</b></a><br/>";
            str += "<b>Message</b>: " + model.message + "<br/>";
            return ReservationEmail("Yacht", str, serverPath);
        }
        public static bool InquiryCars(UserReuqestCar model, string serverPath)
        {
            var str = "FirstName: <b>" + model.firstname + "</b><br/>";
            str += "LastName: <b>" + model.lastname + "</b><br/>";
            str += "Email: <b>" + model.email + "</b><br/>";
            str += "Budget: <b>" + model.budget + "</b><br/>";
            str += "Check In Date: <b>" + model.date + "</b><br/>";
            str += "Phone: <b>" + model.tel + "</b><br/>";
            str += "Yacht: <a href='" + model.link + "'><b>Click to View Car</b></a><br/>";
            str += "<b>Message</b>: " + model.message + "<br/>";
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
                return SendMail(model);
            }
            catch (Exception e)
            {
                return false;
            }

        }

        public static bool SendMail(SendEmailModel model)
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

            var smtp = new SmtpClient
            {
                Port = smtpSection.Network.Port,
                EnableSsl = smtpSection.Network.EnableSsl,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new NetworkCredential(mail.From.ToString(), smtpSection.Network.Password),
                Host = smtpSection.Network.Host
            };
            smtp.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
            smtp.Send(mail);
            return true;
        }

        public static bool InquiryWork(CustomModels.WorkModel model,string serverPath)
        {
            var str = "Name: <b>" + model.name + "</b><br/>";
            str += "Email: <b>" + model.email + "</b><br/>";
            str += "Speciality: <b>" + model.speciality + "</b><br/>";
            str += "<b>Message</b>: " + model.message + "<br/>";
            
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
                return SendMail(cmodel);
            }
            catch (Exception e)
            {
                return false;
            }

        }
        public static bool InquiryContact(CustomModels.ContactModel model, string serverPath)
        {
            var str = "Name: <b>" + model.name + "</b><br/>";
            str += "Email: <b>" + model.email + "</b><br/>";
            str += "Phone: <b>" + model.phone + "</b><br/>";
            str += "<b>Message</b>: " + model.message + "<br/>";


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
                return SendMail(cmodel);
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
}