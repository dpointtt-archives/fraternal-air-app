<#import "parts/common.ftl" as c>
<#import "parts/modal.ftl" as m>

<@c.page "">

    <#if Session.auser??>
        <@m.logOut></@m.logOut>
    </#if>

    <#include "parts/navbar.ftl">


    <div class="container text-center mt-5 mb-5">
        <img src="/resources/img/plane256x256.png">
        <h1 class="my-text-fat-dark">Помилка!</h1>
    </div>

</@c.page>