<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Interactive_Learning._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
      <script src="jquery-1.6.2.min.js"></script>
  <script>
      $(document).ready(function () {

          // Prevent the web browser from caching AJAX responses
          // Otherwise, clicking for the server time only makes the call the first time you click
          $.ajaxSetup({ cache: false });

          $("#btnAJAXLoad").click(function () {
              $("#divAJAXLoad").load("HogwartsSchoolSong.html");
          }); // End btnAJAXLoad.click()


          $('#lblServerTime').click(function () {
              $.ajax({
                  type: "POST",
                  url: "Default.aspx/ServerTime",
                  data: "{}",
                  contentType: "application/json", // You MUST specify contentType for WebMethods
                  dataType: "json",
                  success: function (msg) {
                      // Replace the div's content with the page method's return.
                      $("#lblServerTime").text(msg.d);
                  } // End success function
              }); // End #lblServerTime.ajax
          }); // End #lblServerTime.click

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

          $("#yellowC").hover(
              function () { $(this).attr('src', './Images/Wyellow.jpg'); },
              function () { $(this).attr('src', './Images/Pyellow.png'); }
          ); // End .hover

      }); // End document.ready
  </script>
    <div class="jumbotron">
        <h1>Learning is fun!</h1>
        <p>Click on a photo below to learn the word!</p>
        
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Learn Colors!</h2>
            <p>
                Click on a color to learn the word!
                <img id="yellowC" src="./Images/Pyellow.png" style="width:259px; height: 194px;" />
                <img src="Pblue.png" />
                <img src="Wblue.jpg" />
                <img src="Pred.jpg" />
                <img src="Wred.jpg" />
                <img src="Pgreen.png" />
                <img src="Wgreen.jpg" />
               
            </p>
        </div>
        <div class="col-md-4">
            <h2>Learn Numbers!</h2>
            <p>
                count the balloons! click on the balloons after you count to see the answer!
                <img src="Pone.png" />
                <img src="N1.png" />
                <img src="Ptwo.png" />
                <img src="N2.png" />
                <img src="Pthree.png" />
                <img src="N3.png" />
                <img src="Pfour.png" />
                <img src="N4.png" />
                
            </p>

        </div>
        <div class="col-md-4">
            <h2>Learn Animals!</h2>
            <p>
                Guess the animal! click to see the answer!
                <img src="Pbear.jpg" />
                <img src="Wbear.png" />
                <img src="Pcat.jpg" />
                <img src="Wcat.png" />
                <img src="Pdog.jpg" />
                <img src="Wdog.jpg" />
                <img src="Pmouse.png" />
                <img src="Wmouse.jpg" />
            </p>
        </div>
    </div>
</asp:Content>
