
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="/static/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
</head>
<body style="background: #171717">
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default" style="margin-top:45px; background-color: black; color: black">
                <div class="heading" style="background-color: black; color: black">
                    <h2 class="top-title" style="color: darkorange; margin-left: 31%; margin-top: 20px">Вход в систему</h2>
                </div>
                <div class="panel-body">
                    <#if logout>
                        <div class="alert alert-info" role="alert">Вы вышли из системы!</div>
                    </#if>
                    <#if error>
                        <div class="alert alert-danger" role="alert">Неверный логин или пароль!</div>
                    </#if>

                    <form method="post">
                        <input name="${_csrf.parameterName}" value="${_csrf.token}" type="hidden">
                        <div class="form-group">
                            <label for="username" style="color: darkorange">Логин</label>
                            <input type="text" class="input-form" id="username" placeholder="Логин"
                                   name="username" style="border: 2px solid darkorange;">
                        </div>
                        <div class="form-group">
                            <label for="password" style="color: darkorange">Пароль</label>
                            <input type="password" class="input-form" id="password" placeholder="Пароль"
                                   name="password" style="border: 2px solid darkorange;">
                        </div>
                        <div class="btn-login">
                            <button type="submit" class="signin">Войти</button>
                        </div>
                        <a href="registration" style="color: darkorange; margin-left: 74%">Зарегистрироваться</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<#include "parts/footer.ftl">
</html>
