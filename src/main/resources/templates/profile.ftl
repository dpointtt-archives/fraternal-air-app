<#import "parts/common.ftl" as c>
<#import "parts/modal.ftl" as m>

<@c.page "">

    <#if Session.auser??>
        <@m.logOut></@m.logOut>
    </#if>

    <#include "parts/navbar.ftl">


        <div class="container text-center mt-5 mb-5">
            <img src="/resources/img/plane256x256.png">
            <h1 class="my-text-fat-dark">Інформація про акаунт</h1>
        </div>

        <div class="container text-center">
            <h2 class="my-text-light mb-2">Повне ім'я: ${Session.auser.firstName} ${Session.auser.lastName}</h2>
            <h2 class="my-text-light mb-2">Дата народження: ${Session.auser.dateOfBirth}</h2>
            <h2 class="my-text-light mb-2">Email: ${Session.auser.email}</h2>
        </div>
    <div class="container text-center mt-4">
    <#if ticketList?has_content>
        <h1 class="my-text-fat-dark">Ваші квитки</h1>
        <#list ticketList as ticket>
            <div class="d-flex justify-content-between bg-black mb-3 rounded-3" style="height: 120px;">
                <div class="container text-sm-start float-start">
                    <br>
                    <h2 class="my-text-thin-dark" style="font-size: 14px">Код квитка: ${ticket.ticketCode}</h2>
                    <h2 class="my-text-thin-dark" style="font-size: 18px">Напрямок: ${ticket.flight.endAirport.airportName}, ${ticket.flight.country.countryName}</h2>
                    <h2 class="my-text-thin-dark" style="font-size: 18px">${ticket.flight.flightStartTime} — ${ticket.flight.flightEndTime}</h2>
                </div>
                <div class="container text-sm-end float-end">
                    <br>
                    <br>
                    <br>
                    <form action="/profile/${ticket.ticketCode}/download" method="post">
                        <button type="submit" class="btn btn-primary">Завантажити</button>
                    </form>
                </div>
            </div>
        </#list>
    </#if>
    </div>

</@c.page>