<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #000000; height: 80px">
    <a class="navbar-brand" href="/" style="margin-left: 1%"><img class="logo" src="/static/icon.jpg" height="60px" width="60px"></a>
<#--    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"-->
<#--            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">-->
<#--        <span class="navbar-toggler-icon"></span>-->
<#--    </button>-->
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
            <#if isAdmin>

            <form method="get" action="/createuser">
                <button class="signin" type="submit">Пользователи</button>
            </form>
<#--                    <a class="signin" href="/createuser" >Создать пользователя</a>-->
            <form method="get" action="/createstore">
                <button class="signin" type="submit">Торговые точки</button>
            </form>

            </#if>
            <#if name != "unknown" && !isAdmin && !isManager>
                <div class="mr-3">
<#--                    <form method="get" action="/createtovarooborot">-->
<#--                        <input type="hidden" name="id_user" value="${id}">-->
<#--                        <button class="btn btn-info" type="submit"> Работа с товарооборотом</button>-->
<#--                    </form>-->
                    <form method="get" action="/createtovarooborot">
                        <button class="signin" type="submit">Товарооборот</button>
                    </form>
                </div>
            </#if>
            <#if isManager>
                <form method="get" action="/createotchettovar">
                    <button class="signin" type="submit">Отчет по выбранным точкам</button>
                </form>
                <form method="get" action="/createtovarooborot/tovar/otchet">
                    <button class="signin" type="submit">Консолидированная отчетность</button>
                </form>
            <#--                <div class="nav-item mr-4">-->
            <#--                    <form method="get" action="/carlist">-->
            <#--                        <input type="hidden" name="id" value="${id}">-->
            <#--&lt;#&ndash;                        <button class="btn btn-primary" type="submit"> Мои машины</button>&ndash;&gt;-->
            <#--                    </form>-->
            <#--                </div>-->
            </#if>

        </ul>

        <#if name == "unknown">
            <form action="/login" method="post">
                <button class="signin" type="submit">Войти</button>
            </form>
        <#else>

            <div class="mr-4 reveal" style="color: white"><b>${name}</b></div>
            <@l.logout />
        </#if>

    </div>
</nav>