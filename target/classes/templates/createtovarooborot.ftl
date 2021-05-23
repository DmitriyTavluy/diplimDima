<#import "parts/common.ftl" as c>

<@c.page "none">
    <div class="user-container">
        <div class="add-user-container">
            <div class="add-user-container-child">
                <form method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <h3 class="title-add reveal" style="color: white; text-align: center">Добаление данных о товарообороте</h3>
                    <input class="input-form" type="text" name="volume" placeholder="Объем продаж">
                    <input class="input-form" type="text" name="assortment" placeholder="Структура ассортимента">
                    <input class="input-form" type="text" name="speed" placeholder="Скорость товарооборота">
                    <input class="input-form" type="text" name="rhythm" placeholder="Ритмичность продаж" style="margin-bottom: 5px">
                    <div class="date-container">
                        <div class="date-container-child">
                            <input class="input-form" type="date" name="datetime" placeholder="Дата">
                        </div>
                        <div class="city-container-child">
                            <select name="choisestore" class="input-form" data-style="btn-info" style="height: 45px" >
                                <#list stores as store>
                                    <option value="${store.city}">${store.city}</option>
                                </#list>
                            </select>
                        </div>
                    </div>
                    <button class="signin-body" type="submit">Добавить</button>
                </form>
            </div>
        </div>
        <div class="find-user-container">
            <div class="find-user-container-child">
                <form method="post" action="/createtovarooborot/filter">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <h3 class="title-find reveal" style="color: white; text-align: center">Поиск данных о товарообороте</h3>
                    <input class="input-form" type="text" name="filter" placeholder="Введите дату">
                    <button class="signin-body" type="submit">Поиск</button>
                </form>
            </div>
        </div>
    </div>
    <div class="wrapper">
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div>
                <table class="table" style="margin: 0 auto; max-width: 1400px; margin-bottom: 70px">
                    <thead>
                    <tr class="reveal" style="color: white">
                        <th style="border-bottom: 4px solid darkorange" scope="col">Объем продаж</th>
                        <th style="border-bottom: 4px solid darkorange" scope="col">Структура ассортимента</th>
                        <th style="border-bottom: 4px solid darkorange" scope="col">Скорость товарооборота</th>
                        <th style="border-bottom: 4px solid darkorange" scope="col">Ритмичность продаж</th>
                        <th style="border-bottom: 4px solid darkorange" scope="col" width="150">Дата</th>
                        <th style="border-bottom: 4px solid darkorange" scope="col">Город</th>
                        <th style="border-bottom: 4px solid darkorange" scope="col" width="100">Редактирование</th>
                        <th style="border-bottom: 4px solid darkorange" scope="col" width="100">Удаление</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list tovarooborots as tovarooborot>
                        <tr style="color: darkorange">
                            <td>${tovarooborot.volume}</td>
                            <td>${tovarooborot.assortment}</td>
                            <td>${tovarooborot.speed}</td>
                            <td>${tovarooborot.rhythm}</td>
                            <td>${tovarooborot.datetime}</td>
                            <td>${tovarooborot.id.city}</td>

                            <td>
                                <form method="get" action="/createtovarooborot/${tovarooborot.idtovar}">
                                    <button type="submit" class="signin-body">Редактировать</button>
                                </form>
                            </td>
                            <td>
                                <form method="post" action="/createtovarooborot/deleteTovarooborot">
                                    <#list stores as store>
                                    </#list>
                                    <input type="hidden" value="${tovarooborot.idtovar}" name="tovarooborotId">
                                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                                    <button class="signin-body" type="submit">Удалить</button>
                                </form>

                            </td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
</@c.page>