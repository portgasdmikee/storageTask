<#import "parts/common.ftl" as c>

<@c.page>
    <div class="container">
    <form action="/sendProduct" method="post">
        <div class="mb-3">
            <label class="form-label">Название товара</label>
            <input type="text" name="name" class="form-control" placeholder="Название товара">
        </div>
        <div class="mb-3">
            <label class="form-label">Количество товара</label>
            <input type="text" name="amount" class="form-control" placeholder="Количество">
            <p>шт.</p>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit" class="btn btn-primary">Отправить</button>
    </form>
    </div>

</@c.page>