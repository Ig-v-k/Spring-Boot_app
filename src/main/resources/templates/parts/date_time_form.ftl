<#macro date_time_form_page>
    <form action="/ttime" method="post">
        <div class="clock-input">
            <h3>Room number:</h3>
            <br>
            <div class="input-group input-group-lg">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-lg">Nr.</span>
                </div>
                <input step="1" min="200" max="550" placeholder="000" required type="number" name="nrPokoju" class="form-control ${(userRoomError??)?string('is-invalid', '')}" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
                <#if userRoomError??>
                    <div class="invalid-feedback">
                        ${userRoomError}
                    </div>
                </#if>
            </div>
            <div class="container">

            </div>
            <div class="row justify-content-md-center">
                <div class="col col-lg-2">
                    <input type="datetime-local" name="time_to" class="time-to" id="time-to">
                </div>
            </div>
            <br>
            <div class="row justify-content-md-center">
                <div class="col col-lg-2">
                    <button class="btn btn-primary" type="submit">Send</button>
                </div>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</#macro>