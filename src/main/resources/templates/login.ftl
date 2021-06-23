<#import "parts/common.ftl" as c>

<@c.page>
    <div class="container">
<form action="/login" method="post">
    <div class="mb-3">
        <label class="form-label">Имя пользователя</label>
        <input type="text" name="username" class="form-control" placeholder="Имя пользователя">
    </div>
    <div class="mb-3">
        <label class="form-label">Пароль</label>
        <input type="password" name="password" class="form-control" placeholder="Пароль">
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary">Войти</button>
</form>
    </div>
</@c.page>