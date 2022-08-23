<#import "parts/common.ftl" as c>
<#import "parts/modal.ftl" as m>

<@c.page "plane">

    <#if Session.auser??>
        <@m.logOut></@m.logOut>
    <#else>
        <@m.signUp></@m.signUp>
        <@m.logIn></@m.logIn>
    </#if>

    <@m.error></@m.error>

    <#include "parts/navbar.ftl">

    <div class="container text-center" style="margin-top: -7vh;">
        <img src="/resources/img/love.png">
        <h1 class="my-text-fat-dark mb-4" style="margin-top: -10vh;">Fraternal Air</h1>
        <h2 class="my-text-thin-dark">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</h2>

        <input id="about-us" type="button" class="btn btn-lg btn-primary mt-4" value="Про нас" />
    </div>


    <div class="container text-center" style="margin-top: 30vh;">
        <h1 class="my-text-fat-dark mb-4" style="margin-top: 10vh;">Нові рейси</h1>

        <#list newflights as flight>
            <div class="d-flex justify-content-between bg-black mb-3 rounded-3" style="height: 150px;">
                <div class="container text-sm-start float-start">
                    <img src="/resources/img/plane256x256.png" style="height: 50px">
                    <h2 class="my-text-thin-dark" style="font-size: 18px">${flight.plane.planeModel}</h2>
                    <h2 class="my-text-thin-dark" style="font-size: 18px">${flight.startAirport.defaultAirportName}, ${flight.startAirport.defaultCountryName} — ${flight.endAirport.airportName}, ${flight.country.countryName}</h2>
                    <h2 class="my-text-thin-dark" style="font-size: 18px">${flight.flightStartTime} — ${flight.flightEndTime}</h2>
                </div>
                <div class="container text-sm-end float-end">
                    <br>
                    <br>
                    <br>
                    <h2 class="my-text-thin-dark" style="font-size: 18px">Вільних місць ${flight.flightFreeSeat}</h2>
                    <button class="btn btn-primary disabled">Купити квиток</button>
                </div>
            </div>
        </#list>

        <#if Session.auser??>
            <a type="button" class="btn btn-lg btn-primary mt-4" href="/flights/country=all">Показати більше</a>
        <#else>
            <a type="button" class="btn btn-lg btn-primary mt-4 disabled" href="/flights/country=all">Показати більше</a>
            <h2 class="my-text-thin-dark mt-3" style="font-size: 18px !important;">Для перегляду сполучень, потрібно увійти в акаунт</h2>
        </#if>

    </div>

    <hr style="margin-top: 10vh;">

    <div class="container text-center" id="aboutUs">
        <h1 class="my-text-fat-dark mb-4" style="margin-top: 10vh;">Про нас</h1>
        <h2 class="my-text-thin-dark">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</h2>
    </div>

    <hr style="margin-top: 10vh;">

    <div class="container text-center">
        <h2 class="my-text-thin-dark">Fraternal Air© 2022</h2>
    </div>

</@c.page>