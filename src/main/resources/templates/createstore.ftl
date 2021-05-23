<#import "parts/common.ftl" as c>

<@c.page "none">
    <div class="user-container">
        <div class="add-user-container">
            <div class="add-user-container-child">
                <form method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <h3 class="title-add reveal" style="color: white; text-align: center">Добаление торговой точки</h3>
                    <input class="input-form" type="text" name="region" placeholder="Регион">
                    <input class="input-form" type="text" name="city" placeholder="Город">
                    <input class="input-form" type="text" name="address" placeholder="Адрес">
                    <button class="signin-body" type="submit">Добавить</button>
                </form>
            </div>
        </div>
        <div class="find-user-container">
            <div class="find-user-container-child">
                <form method="post" action="/createstore/filter">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <h3 class="title-find reveal" style="color: white; text-align: center">Поиск торговых точек </h3>
                    <input class="input-form" type="text" name="filter" placeholder="Введите адрес">
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
                        <th style="border-bottom: 4px solid darkorange" scope="col">Регион</th>
                        <th style="border-bottom: 4px solid darkorange" scope="col">Город</th>
                        <th style="border-bottom: 4px solid darkorange" scope="col">Адрес</th>
                        <th style="border-bottom: 4px solid darkorange" scope="col" width="100">Редактирование</th>
                        <th style="border-bottom: 4px solid darkorange" scope="col" width="100">Удаление</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list stores as store>
                        <tr style="color: darkorange">
                            <td>${store.region}</td>
                            <td>${store.city}</td>
                            <td>${store.address}</td>
                            <td>
                                <form method="get" action="/createstore/${store.id}">
                                    <button type="submit" class="signin-body">Редактировать</button>
                                </form>
                            </td>
                            <td>
                                <form method="post" action="/createstore/deleteStore">
                                    <input type="hidden" value="${store.id}" name="storeId">
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