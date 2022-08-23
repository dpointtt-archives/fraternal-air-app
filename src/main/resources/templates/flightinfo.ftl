<#import "parts/common.ftl" as c>
<#import "parts/modal.ftl" as m>

<@c.page "">

    <#if Session.auser??>
        <@m.logOut></@m.logOut>
    </#if>

    <#include "parts/navbar.ftl">

    <#if flightInfo??>
    <div class="container text-center mt-5 mb-5">
        <img src="/resources/img/plane256x256.png">
        <h1 class="my-text-fat-dark">Інформація про сполучення</h1>
    </div>

        <div class="container text-center">
            <h2 class="my-text-light mb-2">Код сполучення: ${flightInfo.flightCode}</h2>
            <h2 class="my-text-light mb-2">Модель літака: ${flightInfo.plane.planeModel}</h2>
            <h2 class="my-text-light mb-2">Прямує від ${flightInfo.startAirport.defaultAirportName}, ${flightInfo.startAirport.defaultCountryName} до ${flightInfo.endAirport.airportName}, ${flightInfo.country.countryName}</h2>
            <h2 class="my-text-light mb-2">Час відправлення: ${flightInfo.flightStartTime}</h2>
            <h2 class="my-text-light mb-2">Час прибуття: ${flightInfo.flightEndTime}</h2>
            <h2 class="my-text-light mb-4">Вільних місць: ${flightInfo.flightFreeSeat}</h2>
            <form action="/flights/${flightInfo.flightCode?string}/buy" method="post">
                <button class="btn btn-primary btn-lg" type="submit">Придбати квиток</button>
            </form>
        </div>
    <#else>
        <div class="container text-center mt-5 mb-5">
            <img src="/resources/img/plane256x256.png">
            <h1 class="my-text-fat-dark">Нажаль такого сполучення не існує</h1>
        </div>
    </#if>

</@c.page>