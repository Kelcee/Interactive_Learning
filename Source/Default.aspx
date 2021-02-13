﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Interactive_Learning._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  <script src="Scripts/jquery-3.4.1.min.js"></script>
  <script src="Scripts/jquery-ui-1.12.1/jquery-ui.min.js"></script>
  <link href="Scripts/jquery-ui-1.12.1/jquery-ui.min.css" rel="stylesheet" />
  <script>
      $(document).ready(function () {

          $("#tabs").tabs();

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
    <div class="jumbotron">
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
