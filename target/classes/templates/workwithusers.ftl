<#import "parts/common.ftl" as c>

<@c.page "none">
    <div class="edit-container">
        <div class="add-user-container" style="margin-bottom: 50px; margin-top: 50px;">
            <div class="add-user-container-child">
                <form method="post" action="/createuser/show">
                    <h3 class="title-add reveal" style="color: white; text-align: center">Редактирование пользователя</h3>
                    <h7 class="title-add reveal" style="color: white; text-align: center">Изменить логин</h7>
                    <input class="input-form" type="text" name="username" value="${user.username}">
                    <h7 class="title-add reveal" style="color: white; text-align: center">Изменить пароль</h7>
                    <input class="input-form" type="text" name="password" value="${user.password}">
                    <h7 class="title-add reveal" style="color: white; text-align: center">Изменить почту</h7>
                    <input class="input-form" type="email" name="mail" value="${user.mail}">
                    <input type="hidden" value="${user.id}" name="id">
                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                    <button type="submit" class="signin-body">Изменить</button>
                </form>
            </div>
        </div>
    </div>
</@c.page>