<#import "parts/common.ftl" as c>

<@c.page "none">
    <div class="edit-container">
        <div class="add-user-container" style="margin-bottom: 50px; margin-top: 50px;">
            <div class="add-user-container-child">
                <form method="post" action="/createstore/show">
                    <h3 class="title-add reveal" style="color: white; text-align: center">Редактирование торговой точки</h3>
                    <h7 class="title-add reveal" style="color: white; text-align: center">Изменение региона</h7>
                    <input class="input-form" type="text" name="region" value="${store.region}">
                    <h7 class="title-add reveal" style="color: white; text-align: center">Изменение города</h7>
                    <input class="input-form" type="text" name="city" value="${store.city}">
                    <h7 class="title-add reveal" style="color: white; text-align: center">Изменение адреса</h7>
                    <input class="input-form" type="text" name="address" value="${store.address}">
                    <input type="hidden" value="${store.id}" name="id">
                    <input type="hidden" value="${_csrf.token}" name="_csrf">
                    <button type="submit" class="signin-body">Редактировать</button>
                </form>
            </div>
         <div>
    </div>
</@c.page>