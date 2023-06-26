<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome ZakiEmployee</title>
    <style>
        body{
            background-color: #ffffff;
        }
        .flex-container {
            display: flex;
            flex-wrap: wrap;
        }
        .home-content {
            flex: 30%;
            display: flex;
            color: #0F4C75;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .home-content .first-p{
            font-size: 25px;
        }
        .second-p{
            font-size: 55px;
            font-weight: 700;
            line-height: 65px;
            letter-spacing: 0.06em;
            margin-top: 0px;

        }
        .home-background {
            flex: 70%;
            justify-content: flex-end;
            margin-top: 40px;
        }

    </style>
</head>
<body>

<div class="flex-container">
<div class="home-content">
%{--   <p class="first-p">--}%
%{--    Welcome to--}%
%{--   </p>--}%
   <p class="second-p">
    Zakipoint<br>
    Health<br>
    Staff Portal
   </p>
</div>

 <div class="home-background">
    <g:img dir="grails-app/assets/images/background_img.png" file="background_img.png" />
 </div>
</div>
</body>
</html>
