<#macro date_time_form_page>
    <form action="/ttime" method="post">
        <div class="clock-input">
            <h3>Time for key:</h3>
            <br>
            <div class="input-group input-group-lg">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-lg">Nr.</span>
                </div>
                <input required id="nrPokoju_form" step="1" min="200" max="550" placeholder="000" type="number" name="roomNumberForm" class="form-control ${(userRoomError??)?string('is-invalid', '')}" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
                <#if userRoomError??>
                    <br>
                    <div class="invalid-feedback">
                        ${userRoomError}
                    </div>
                </#if>
                <#if userRoomSuccess??>
                    <br>
                    <div class="alert alert-success" role="alert">
                        ${userRoomSuccess}
                    </div>
                </#if>
            </div>
            <br>
            <div class="row justify-content-md-center">
                <div class="col col-lg-2">
                    <input type="datetime-local" name="time_to" class="time-toClass" id="time-toId">
                </div>
            </div>
            <br>
            <div class="row justify-content-md-center">
                <div class="col col-lg-2">
                    <button class="btn btn-primary" type="submit">Send</button>
                    <#--                    <button onclick="createUser()">Send</button>-->
                </div>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</#macro>