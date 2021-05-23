<#import "parts/common.ftl" as c>

<@c.page "none">
    createotchettovar
        <form method="post" action="/createtovarooborot/show">
            <h3 class="title-add reveal" style="color: white; text-align: center">Редактирование товарооборота</h3>
            <h7 class="title-add reveal" style="color: white; text-align: center">Изменить объем продаж</h7>
            <input class="input-form" type="text" name="volume" value="${tovarooborot.volume}">
            <h7 class="title-add reveal" style="color: white; text-align: center">Изменить структуру ассортимента</h7>
            <input class="input-form" type="text" name="assortment" value="${tovarooborot.assortment}">
            <h7 class="title-add reveal" style="color: white; text-align: center">Изменить корость товарооборота</h7>
            <input class="input-form" type="text" name="speed" value="${tovarooborot.speed}">
            <h7 class="title-add reveal" style="color: white; text-align: center">Изменить ритмичность продаж</h7>
            <input class="input-form" type="text" name="rhythm" value="${tovarooborot.rhythm}">
            <div class="date-container">
                <div class="date-container-child">
                    <h7 class="title-add reveal" style="color: white; text-align: center">Изменить дату</h7>
                    <input class="input-form" type="date" name="datetime" value="${tovarooborot.datetime}">
                </div>
            </div>
            <input type="hidden" value="${tovarooborot.idtovar}" name="idtovar">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <button type="submit" class="signin-body">Изменить</button>
        </form>
    </div>
    </div>
    </div>
</@c.page>