<#import "parts/common.ftl" as c>
<#import "parts/modal.ftl" as m>

<@c.page "">

    <#if Session.auser??>
        <@m.logOut></@m.logOut>
    </#if>

    <#include "parts/navbar.ftl">

    <div class="container text-center mt-5 mb-5">
        <h1 class="my-text-fat-dark">Список сполучень</h1>
        <form action="/flights/findByCountry" method="post">
            <div class="input-group mb-3">
                <label class="input-group-text" for="inputGroupSelect01" style="background-color: #FFB200; color: #277BC0; border-color: #277BC0">Країна</label>
                <select class="form-select" id="inputGroupSelect01" name="country">
                    <option selected>Оберіть</option>
                    <#list countryList as country>
                        <option name="country" value="${country.countryName}">${country.countryName}</option>
                    </#list>
                </select>
            </div>
            <button class="btn btn-lg btn-primary" type="submit">Пошук</button>
        </form>
        <#if findNull??>
            <h2 class="my-text-light mt-3">Нажаль таких сполучень не знайдено</h2>
        </#if>
    </div>

    <div class="container text-center">
        <#list flightList as flight>
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
                    <a class="btn btn-primary" href="/flights/${flight.flightCode?string}">Придбати квиток</a>
                </div>
            </div>
        </#list>
    </div>

</@c.page>