//Kelcee Chorba and Christine Jordan 2.12.2021 CIS235 W6 Team Project
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Interactive_Learning
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string GetJumbotronText(string tabText)
        {
            JumbotronText jumbotronText = new JumbotronText();
            switch (tabText)
            {
                case "Learn Numbers":
                    jumbotronText.LearningTitle = "Learning Numbers is Fun!";
                    jumbotronText.Description = "Count the ballons and click to see the number!";
                    break;
                case "Learn Colors":
                    jumbotronText.LearningTitle = "Learning Colors is Fun!";
                    jumbotronText.Description = "Guess the color and click to see the color name!";
                    break;

                case "Learn Animals":
                    jumbotronText.LearningTitle = "Learning Animals is Fun!";
                    jumbotronText.Description = "Guess the animal and click to see the name of the animal!";
                    break;

                case "Learn Art":
                    jumbotronText.LearningTitle = "Learn all about art work!";
                    jumbotronText.Description = "An interactive section to learn and play with art.";
                    break;

                default:
                    throw new Exception("Unknown tab.");
            }
            return JsonConvert.SerializeObject(jumbotronText);
        }

        public class JumbotronText
        {
            public string LearningTitle { get; set; }
            public string Description { get; set; }
        }
    }
}