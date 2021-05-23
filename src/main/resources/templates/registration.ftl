
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="/static/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!— Latest compiled and minified CSS —>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!— Optional theme —>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
</head>
<body style="background: #171717">
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <div class="panel panel-default" style="margin-top:45px; background-color: black">
                <div class="heading" style="background-color: black; color: black">
                    <h2 class="top-title" style="color: darkorange; margin-left: 22%; margin-top: 20px">Регистрация в системе</h2>
                </div>
                <div class="panel-body">
                    <form method="post" action="/registration">
                        <input name="${_csrf.parameterName}" value="${_csrf.token}" type="hidden">
                        <div class="form-group">
                            <label for="username" style="color: darkorange">Логин</label>
                            <input type="text" class="form-control" id="username" placeholder="Логин"
                                   name="username" style="background-color: #171717; border: 2px solid darkorange;">
                        </div>
                        <div class="form-group">
                            <label for="password" style="color: darkorange">Пароль</label>
                            <input type="password" class="form-control" id="password" placeholder="Пароль"
                                   name="password" style="background-color: #171717; border: 2px solid darkorange;">
                        </div>
                        <div class="form-group">
                            <label for="mail" style="color: darkorange">Почта</label>
                            <input type="email" class="form-control" id="mail" placeholder="почта@gmail.com"
                                   name="mail" style="background-color: #171717; border: 2px solid darkorange;">
                        </div>
                        <div class="btn-logup">
                            <button type="submit" class="signin">
                                Регистрация
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<#include "parts/footer.ftl">
</html>
