<#import "parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <form action="/registration" method="post">
            <div class="mb-3">
                <label class="form-label">Логин</label>
                <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                       class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       placeholder="Имя пользователя">
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
            <div class="mb-3">
                <label class="form-label">Имя</label>
                <input type="text" class="form-control" name="name" placeholder="Имя">
            </div>
            <div class="mb-3">
                <label class="form-label">Фамилия</label>
                <input type="text" class="form-control" name="surname" placeholder="Фамилия">
            </div>
            <div class="mb-3">
                <label class="form-label">Отчество</label>
                <input type="text" class="form-control" name="patronymic" placeholder="Отчество">
            </div>
            <div class="mb-3">
                <label class="form-label">Пароль</label>
                <input type="password" name="password"
                       class="form-control ${(passwordError??)?string('is-invalid', '')}"
                       placeholder="Пароль">
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
            <div class="mb-3">
                <label class="form-label">Повторите пароль</label>
                <input type="password" name="password2"
                       class="form-control ${(password2Error??)?string('is-invalid', '')}"
                       placeholder="Повторите пароль">
                <#if password2Error??>
                    <div class="invalid-feedback">
                        ${password2Error}
                    </div>
                </#if>
            </div>

            <div class="form-check mb-3">
                <input class="form-check-input" type="radio" name="role" value="Кладовщик">
                <label class="form-check-label" for="role">
                    Кладовщик
                </label>
            </div>

            <div class="form-check mb-3">
                <input class="form-check-input" type="radio" name="role" value="Поставщик">
                <label class="form-check-label" for="role">
                    Поставщик
                </label>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" class="btn btn-primary">Регистрация</button>
        </form>
    </div>
</@c.page>