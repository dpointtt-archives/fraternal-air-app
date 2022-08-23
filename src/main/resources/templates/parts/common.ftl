<#macro page bodyimg>
    <!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/resources/css/style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700&display=swap" rel="stylesheet">
        <link rel="apple-touch-icon" sizes="180x180" href="/resources/img/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="/resources/img/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="/resources/img/favicon-16x16.png">
        <link rel="manifest" href="/resources/site.webmanifest">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            $(document).ready(function (){
                $("#about-us").click(function (){
                    $('html, body').animate({
                        scrollTop: $("#aboutUs").offset().top
                    }, 150);
                });
            });
        </script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <title>Fraternal Air</title>
    </head>
    <body class="${bodyimg}">
        <#nested>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        <#if loginfail??>
            <script type="module" src="/resources/js/loginErrorModal.js"></script>
        </#if>
        <#if signupfail??>
            <script type="module" src="/resources/js/signUpErrorModal.js"></script>
        </#if>
        <#if signupsuccess??>
            <script type="module" src="/resources/js/signUpSuccessModal.js"></script>
        </#if>

    </body>
</html>
</#macro>