<#import "parts/common.ftl" as c>

<@c.page "none">
    <div class="edit-container">
        <div class="add-user-container" style="margin-bottom: 50px; margin-top: 50px;">
            <div class="add-user-container-child">
                <form method="get" action="/createotchettovar/final/save">
                    <button class="signin-body" type="submit">Создать отчет</button>
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
                        <th style="border-bottom: 4px solid darkorange" scope="col">Кнопка</th>
                        <#--                    <th style="border-bottom: 4px solid darkorange" scope="col" width="100">Редактирование</th>-->
                        <#--                    <th style="border-bottom: 4px solid darkorange" scope="col" width="100">Удаление</th>-->

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
                            <#--                            <td>-->
                            <#--                                <input type="checkbox" name="active">-->
                            <#--                            </td>-->

                            <#if tovarooborot.checkOtchet == true>
                                <td>
                                <div class="button-otchet">
                                    <div class="button-otchet-add">
                                        <form method="post" action="/createotchettovar/final/create">
                                            <input type="hidden" value="${tovarooborot.idtovar}" name="idtovar">
                                            <input type="hidden" value="${_csrf.token}" name="_csrf">
                                            <button class="signin-body" type="submit" disabled>Добавить</button>
                                        </form>
                                    </div>
                                    <div class="button-otchet-undo">
                                        <form method="post" action="/createotchettovar/final/otmena">
                                            <input type="hidden" value="${tovarooborot.idtovar}" name="idtovar">
                                            <input type="hidden" value="${_csrf.token}" name="_csrf">
                                            <button class="signin-body" type="submit">Отменить</button>
                                        </form>
                                    </div>
                                </div>
                                </td>
                            <#else>
                                <td>
                                <div class="button-otchet">
                                    <div class="button-otchet-add">
                                        <form method="post" action="/createotchettovar/final/create">
                                            <input type="hidden" value="${tovarooborot.idtovar}" name="idtovar">
                                            <input type="hidden" value="${_csrf.token}" name="_csrf">
                                            <button class="signin-body" type="submit">Добавить</button>
                                        </form>
                                    </div>
                                    <div class="button-otchet-undo">
                                        <form method="post" action="/createotchettovar/final/otmena">
                                            <input type="hidden" value="${tovarooborot.idtovar}" name="idtovar">
                                            <input type="hidden" value="${_csrf.token}" name="_csrf">
                                            <button class="signin-body" type="submit" disabled>Отменить</button>
                                        </form>
                                    </div>
                                </div>
                                </td>
                            </#if>

                            <#--                        <td>-->
                            <#--                            <form method="get" action="/createtovarooborot/${tovarooborot.idtovar}">-->
                            <#--                                <button type="submit" class="signin-body">Редактировать</button>-->
                            <#--                            </form>-->
                            <#--                        </td>-->
                            <#--                        <td>-->
                            <#--                            <form method="post" action="/createtovarooborot/deleteTovarooborot">-->
                            <#--                                <#list stores as store>-->
                            <#--                                </#list>-->
                            <#--                                <input type="hidden" value="${tovarooborot.idtovar}" name="tovarooborotId">-->
                            <#--                                <input type="hidden" value="${_csrf.token}" name="_csrf">-->
                            <#--                                <button class="signin-body" type="submit">Удалить</button>-->
                            <#--                            </form>-->

                            <#--                        </td>-->
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
</@c.page>