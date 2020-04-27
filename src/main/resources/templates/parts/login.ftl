<#macro login path isRegisterForm>
    <form class="form-signin" action="${path}" method="post">

        <img class="mb-4" src="/static/laundryKey.png" alt="" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal"><#if isRegisterForm>Registration<#else>Sign in</#if></h1>

        <div class="container">
            <div class="row justify-content-center">
                <div class="row">
                    <div class="col-md-auto">
                        <label for="inputLogin" class="sr-only">Login</label>
                        <input type="text" id="inputLogin" class="form-control" placeholder="Login" required="required" autofocus="" name="username">
                    </div>
                </div>
                <div class="w-100 d-none d-md-block"></div>
                <div class="row">
                    <div class="col-md-auto">
                        <label for="inputPassword" class="sr-only">Password</label>
                        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="required" name="password">
                    </div>
                </div>
                <#if isRegisterForm>
                    <div class="w-100 d-none d-md-block"></div>
                    <div class="row">
                        <div class="col-md-auto">
                            <label for="inputEmail" class="sr-only">Email</label>
                            <input id="inputEmail" type="email" name="email" class="form-control" required="required" placeholder="some@some.com" />
                        </div>
                    </div>
                </#if>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="checkbox mb-3">
                <label>
                    <input type="checkbox" value="remember-me"> Remember me
                </label>
            </div>

            <div class="row justify-content-center">
                <div class="col-4">
                    <#if !isRegisterForm><a href="/registration">Add new user</a><#else><a href="/login">Sign in</a></#if>
                </div>
                <div class="col-4">
                    <button class="btn btn-primary" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>
                </div>
            </div>
        </div>

<#--        <#if !isRegisterForm><a href="/registration">Add new user</a></#if>-->
<#--        <button class="btn btn-primary" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>-->
        <p class="mt-5 mb-3 text-muted">© 2020</p>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">Sign Out</button>
    </form>
</#macro>