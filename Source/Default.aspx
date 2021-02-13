<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Interactive_Learning._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  


    <%--Jquery UI Theme REFERENCE: https://jqueryui.com/themeroller/#!zThemeParams=5d000080000b06000000000000003d8888d844329a8dfe02723de3e5701167f993e3f4a54f5b89700528b8c6a4b52e66c5646aed5b94a3be2ca8d36d89a23f6d30a0797040ed566a2813af62f4ae6d7bfc119762a762b427eb404eae176cd8a0e883cd7478bab7fee966d67afff31c202a9a3ce05c3122d4ec595eac4ead51ad99762b6014d09cc37d55f2ce36b9c815439a49a44bbb914331364b96e3986059b73f1e83f5cf734ba7d4fdf009cd8950bf4cdf982f82c768d0a76d4f8cfe048e12fefb1ea9bc0926e504e34c7e9a8a761ec6bf211030a0eaeab9ae0cd9a3ff5f49eddeaa44f86144ca9089e911120e7811a148c412cdbb03caf4d7e7eb2d4a0450efc6f47de25baabcf7d0aac71873ab622a380bac7375243ff7ba34768d9b74dce021b03e0789787ac622f227d9ad8769ee44cee747a0ff208348da3c5e0ba1572186b554a8d17154608f93445ddaccf8d90adaf370b7c5b7bd83004db8be766024128f665eeaee242e1aadfb271cec0cb35ef51942575d00d31c2b3fd139ed1ea2fc8ec2c0314dbd4631fb77e6ea5000c4d2a451c9821b2b16f64d864aabc5ff5b49a2dd1f01d90ef7c3ace2f876d66e8e4d570e772dae3f6f57e6764101df1858e278ab8a5a2195bc6b787bf8c1d94928ad384b3159377911f8fe05288f59fbf18d748920a2ff23d913b65951c2dc65c2ae33eba207a1549d0890d81e61e6b712c3a19bbf992e59843bc59b8c3f70fd0cca8bffc6d5bf89--%>
  <script src="Scripts/jquery-ui-1.12.1/jquery-ui.min.js"></script>
  <link href="Scripts/jquery-ui-1.12.1/jquery-ui.min.css" rel="stylesheet" />
  <script>
      $(document).ready(function () {

          $("#tabs").tabs({
              activate: function (event, ui) {
                  console.log(ui.newTab[0].innerText);

                  var sendData = { "tabText": ui.newTab[0].innerText };

                  $.ajax({
                      type: "POST",
                      url: "Default.aspx/GetJumbotronText",
                      data: JSON.stringify(sendData),
                      contentType: "application/json", // You MUST specify contentType for WebMethods
                      dataType: "json",
                      success: function (response) {
                          console.log(response);
                      } // End success function
                  }); // End 
              } 
          });

          // Prevent the web browser from caching AJAX responses
          // Otherwise, clicking for the server time only makes the call the first time you click
          $.ajaxSetup({ cache: false });

          $("#btnAJAXLoad").click(function () {
              $("#divAJAXLoad").load("HogwartsSchoolSong.html");
          }); // End btnAJAXLoad.click()


          

          $('#btnAJAXGet').click(function () {
              sendData = "{ \"userName\": \"" + $("#userName").val() + "\"}"
              $.ajax({
                  type: "POST",
                  url: "GetReply.aspx/Login",
                  data: sendData,
                  contentType: "application/json",
                  dataType: "json",
                  success: function (msg) {
                      // Replace the div's content with the page method's return.
                      $("#lblLoginResult").text(msg.d);
                  } // End success function
              }); // End #btnAJAXGet.ajax
          }); // End #btnAJAXGet.click

          //colors .hover using jquery event handlders
          $("#yellowC").hover(
              function () { $(this).attr('src', './Images/Wyellow.jpg'); },
              function () { $(this).attr('src', './Images/Pyellow.png'); }
          ); 

          $("#redC").hover(
              function () { $(this).attr('src', './Images/Wred.jpg'); },
              function () { $(this).attr('src', './Images/Pred.jpg'); }
          ); 

          $("#blueC").hover(
              function () { $(this).attr('src', './Images/Wblue.jpg'); },
              function () { $(this).attr('src', './Images/Pblue.png'); }
          ); 

          $("#greenC").hover(
              function () { $(this).attr('src', './Images/Wgreen.jpg'); },
              function () { $(this).attr('src', './Images/Pgreen.png'); }
          ); 

          //numbers .hover
          $("#one").hover(
              function () { $(this).attr('src', './Images/N1.png'); },
              function () { $(this).attr('src', './Images/Pone.png');}
          );

          $("#two").hover(
              function () { $(this).attr('src', './Images/N2.png'); },
              function () { $(this).attr('src', './Images/Ptwo.png'); }
          );

          $("#three").hover(
              function () { $(this).attr('src', './Images/N3.jpg'); },
              function () { $(this).attr('src', './Images/Pthree.jpg'); }
          );

          $("#four").hover(
              function () { $(this).attr('src', './Images/N4.png'); },
              function () { $(this).attr('src', './Images/Pfour.png'); }
          );

          //animals .hover
          $("#dog").hover(
              function () { $(this).attr('src', './Images/Wdog.jpg'); },
              function () { $(this).attr('src', './Images/Pdog.jpg'); }
          );

          $("#cat").hover(
              function () { $(this).attr('src', './Images/Wcat.png'); },
              function () { $(this).attr('src', './Images/Pcat.jpg'); }
          );

          $("#bear").hover(
              function () { $(this).attr('src', './Images/Wbear.png'); },
              function () { $(this).attr('src', './Images/Pbear.jpg'); }
          );

          $("#mouse").hover(
              function () { $(this).attr('src', './Images/Wmouse.jpg'); },
              function () { $(this).attr('src', './Images/Pmouse.png'); }
          );

      }); // End document.ready
  </script>
    <div class="jumbotron bannerbackground">
        <h1>Learning is fun!</h1>
        <p>Hover your mouse over a photo below to learn the word!</p>
        
    </div>

    <div id="tabs" class="row"> <%--setting up id for tab--%>
        <ul>
            <li><a href="#colorTab">Learn Colors</a></li>
            <li><a href="#numberTab">Learn Numbers</a></li>
            <li><a href="#animalTab">Learn Animals</a></li>
        </ul>
        <div id="colorTab" class="col-md-4"> <%--assigning id to div--%>
            <h2>Learn Colors!</h2>
            <p>Click on a color to learn the word!</p>
            <div style="display: inline-flex;">
                <div><img id="yellowC" src="./Images/Pyellow.png" class="image-size" /></div>
                <div><img id="blueC"src="./Images/Pblue.png" class="image-size"  /></div>
                <div><img id="redC" src="./Images/Pred.jpg" class="image-size"  /></div>
                <div><img id="greenC" src="./Images/Pgreen.png" class="image-size"  /></div>             
            </div>
        </div>
        <div id="numberTab" class="col-md-4">
            <h2>Learn Numbers!</h2>
            <p>Count the balloons!</p>
            <div style="display: inline-flex;">
                <div><img id="one" src="./Images/Pone.png" class="image-size" /></div>
                <div><img id="two" src="./Images/Ptwo.png" class="image-size"/></div>
                <div><img id="three" src="./Images/Pthree.jpg" class="image-size" /></div>
                <div><img id="four" src="./Images/Pfour.png" class="image-size" /></div> 
            </div>

        </div>
        <div id="animalTab" class="col-md-4">
            <h2>Learn Animals!</h2>
            <p>Guess the animal! click to see the answer!</p>
            <div style="display: inline-flex;">
                <div><img id="bear" src="./Images/Pbear.jpg" class="image-size" /></div>
                <div><img id="cat" src="./Images/Pcat.jpg" class="image-size"/></div>
                <div><img id="dog" src="./Images/Pdog.jpg" class="image-size"/></div>
                <div><img id="mouse" src="./Images/Pmouse.png" class="image-size"/></div>
            </div>
        </div>
    </div>
</asp:Content>
