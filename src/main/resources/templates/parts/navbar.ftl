<header>
    <nav class="navbar navbar-expand-lg ">
        <div class="container">
            <a class="navbar-brand " href="/main">Склад для товаров</a>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto mb-2 mb-lg-0 ">
                    <#if !Session.SPRING_SECURITY_CONTEXT??>
                    <li class="nav-item">
                        <a class="nav-link" href="/registration">Регистрация</a>
                    </li>
                    </#if>
                    <#if !Session.SPRING_SECURITY_CONTEXT??>
                    <li class="nav-item">
                        <a class="nav-link" href="/login">Войти</a>
                    </li>
                    </#if>

                    <#if Session.SPRING_SECURITY_CONTEXT??>
                    <form action="/logout" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}" />
                        <input class="btn btn-primary" type="submit" value="Выйти"/>
                    </form>
                    </#if>
                </ul>
            </div>
        </div>
    </nav>
</header>