<#macro login path isRegisterForm>
    <form class="form-signin" action="${path}" method="post">

        <img class="mb-4" src="/static/laundryKey.png" alt="" width="72" height="72">
        <h1 class="h3 mb-3 font-weight-normal"><#if isRegisterForm>Registration<#else>Sign in</#if></h1>

        <div class="container">
            <div class="row justify-content-center">

                <#-- username -->
                <div class="row">
                    <div class="col-md-auto">
                        <label for="inputUserName" class="sr-only">User name:</label>
                        <input type="text" id="inputUserName" class="form-control ${(usernameError??)?string('is-invalid', '')}"
                               value="<#if user??>${user.username}</#if>" placeholder="User name" autofocus required name="username">
                        <#if usernameError??>
                            <div class="invalid-feedback">
                                ${usernameError}
                            </div>
                        </#if>
                    </div>
                </div>
                <div class="w-100 d-none d-md-block"></div>

                <#-- pasword -->
                <div class="row">
                    <div class="col-md-auto">
                        <label for="inputPassword" class="sr-only">Password</label>
                        <input type="password" id="inputPassword" class="form-control ${(passwordError??)?string('is-invalid', '')}"
                               placeholder="Password" required name="password">
                        <#if passwordError??>
                            <div class="invalid-feedback">
                                ${passwordError}
                            </div>
                        </#if>
                    </div>
                </div>
                <#if isRegisterForm>
                    <div class="w-100 d-none d-md-block"></div>

                    <#-- pasword2 -->
                    <div class="row">
                        <div class="col-md-auto">
                            <label for="inputPassword2" class="sr-only">Repeat password</label>
                            <input type="password" id="inputPassword2" class="form-control ${(password2Error??)?string('is-invalid', '')}"
                                   placeholder="Password repeat" required name="password2">
                            <#if password2Error??>
                                <div class="invalid-feedback">
                                    ${password2Error}
                                </div>
                            </#if>
                        </div>
                    </div>
                    <div class="w-100 d-none d-md-block"></div>

                    <#-- cardNumber -->
                    <div class="row">
                        <div class="col-md-auto">
                            <label class="sr-only">Card number</label>
                            Card number:
                            <input class="form-control ${(cardnumberError??)?string('is-invalid', '')}" id="inputCardNumber" type="number" name="cardNumber" step="1" min="3000" max="4000" placeholder="0000" autofocus required>
                            <span class="validity"></span>
                            <#if cardnumberError??>
                                <div class="invalid-feedback">
                                    ${cardnumberError}
                                </div>
                            </#if>
                        </div>
                    </div>
                    <div class="w-100 d-none d-md-block"></div>

                    <#-- roomNumber -->
                    <div class="row">
                        <div class="col-md-auto">
                            <label for="inputRoomNumber" class="sr-only">Room number</label>
                            Room number:
                            <input class="form-control ${(roomnumberError??)?string('is-invalid', '')}" id="inputRoomNumber" type="number" name="roomNumber" step="1" min="200" max="550" placeholder="000" required>
                            <span class="validity"></span>
                            <#if roomnumberError??>
                                <div class="invalid-feedback">
                                    ${roomnumberError}
                                </div>
                            </#if>
                        </div>
                    </div>
                    <div class="w-100 d-none d-md-block"></div>

                    <#-- emailError -->
                    <div class="row">
                        <div class="col-md-auto">
                            <label for="inputEmail" class="sr-only">Email</label>
                            <input id="inputEmail" type="email" name="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                                   value="<#if user??>${user.email}</#if>" required="required" placeholder="some@some.com" />
                            <#if emailError??>
                                <div class="invalid-feedback">
                                    ${emailError}
                                </div>
                            </#if>
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