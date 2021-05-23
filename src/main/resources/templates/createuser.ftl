<#import "parts/common.ftl" as c>

<@c.page "none">
    <div class="user-container">
        <div class="add-user-container">
            <div class="add-user-container-child">
                <form method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <h3  class="title-add reveal" style="color: white; text-align: center">Добаление пользователя</h3>
                    <input class="input-form" type="text" name="username" placeholder="Логин">
                    <input class="input-form" type="text" name="password" placeholder="Пароль">
                    <input class="input-form" type="text" name="mail" placeholder="Почта">
                    <input class="input-form" type="text" name="roles" placeholder="Роль">
                    <div class="checkbox-content">
                        <input type="checkbox" name="active">
                        <h7 class="reveal" style="color: white">Активировать пользователя  </h7>
                    </div>
                    <button class="signin-body" type="submit">Добавить</button>
                </form>
            </div>
        </div>
        <div class="find-user-container">
            <div class="find-user-container-child">
                <form method="post" action="/createuser/filter">
                    <input  type="hidden" name="_csrf" value="${_csrf.token}">
                    <h3 class=" title-find reveal" style="color: white; text-align: center" >Поиск пользователей</h3>
                    <input class="input-form" type="text" name="filter" placeholder="Введите логин">
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
                        <th style="border-bottom: 4px solid darkorange" scope="col">Логин</th>
                        <th style="border-bottom: 4px solid darkorange" scope="col">Пароль</th>
                        <th style="border-bottom: 4px solid darkorange" scope="col">Электронная почта</th>
                        <th style="border-bottom: 4px solid darkorange" scope="col">Активность</th>
                        <th style="border-bottom: 4px solid darkorange" scope="col" width="100">Редактирование</th>
                        <th style="border-bottom: 4px solid darkorange" scope="col" width="100">Удаление</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list users as user>
                        <tr style="color: darkorange">
                            <td>${user.username}</td>
                            <td>${user.password}</td>
                            <td>${user.mail}</td>
                            <td>${user.active?c}</td>
                            <td>
                                <form method="get" action="/createuser/${user.id}">
                                    <button type="submit" class="signin-body">Редактировать</button>
                                </form>
                            </td>
                            <td>
                                <form method="post" action="/createuser/deleteUser">
                                    <input type="hidden" value="${user.id}" name="userId">
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
