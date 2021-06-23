<#import "parts/common.ftl" as c>

<@c.page>
    <div>
        <div class="container">
            <div class="row">
                <div class="col">
                    <h2>${user.surname?ifExists} ${user.name?ifExists} ${user.patronymic?ifExists}</h2>
                    <h3>${user.getRole()}</h3>

                </div>
            </div>
        </div>
    </div>



    <div class="container">
        <div class="row">
            <div class="col">

                <table class="table">
                    <thead class="thead-dark">

                    <tr>
                        <th scope="col">Название товара</th>
                        <th scope="col">Количество</th>
                        <th scope="col">Поставщик</th>
                        <th scope="col">Дата отправки</th>
                        <th scope="col">Дата прибытия</th>
                        <th scope="col">Статус</th>
                        <th scope="col">Действия</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list products as product>
                    <tr>
                        <th>${product.name}</th>
                        <td>${product.amount}</td>
                        <td>${product.user.name}</td>
                        <td>${product.dateSend}</td>
                        <td>${product.datereceive?ifExists}</td>
                        <td>${product.status.name}</td>
                        <td>
                            <#if product.status.id == 1>
                            <form action="/receiveProduct" method="post">
                                <button type="submit" >Принять</button>
                                <input type="hidden" name="product" value="${product.id}">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            </form>
                            </#if>
                        </td>
                    </tr>
                    </#list>

                    </tbody>
                </table>

            </div>
        </div>
    </div>
</@c.page>