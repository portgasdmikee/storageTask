<#import "parts/common.ftl" as c>

<@c.page>
    <div>
        <div class="container">
            <div class="row">
                <div class="col">
                    <h2>${user.surname?ifExists} ${user.name?ifExists} ${user.patronymic?ifExists}</h2>
                    <h3>${user.getRole()}</h3>

                    <form action="/sendProduct" method="get">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <input class="btn btn-primary" type="submit" value="Отправить товар"/>
                    </form>

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
                        <th scope="col">Дата отправки</th>
                        <th scope="col">Статус</th>
                        <th scope="col">Действия</th>

                    </tr>
                    </thead>
                    <tbody>
                    <#list user.getProductList() as product>
                        <tr>

                            <th>${product.name}</th>
                            <td>${product.amount}</td>
                            <td>${product.dateSend}</td>
                            <td>${product.status.name}</td>
                            <td>
                                <form action="/deleteProduct" method="post">
                                    <button type="submit" >УДАЛИТЬ</button>
                                    <input type="hidden" name="product" value="${product.id}">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                </form>
                            </td>

                        </tr>
                    </#list>


                    </tbody>

                </table>

            </div>
        </div>
    </div>
</@c.page>