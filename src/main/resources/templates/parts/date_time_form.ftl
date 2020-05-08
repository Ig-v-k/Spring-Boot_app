<#macro date_time_form_page>
    <form action="/asd" method="post">
        <div class="clock-input">
            <label for="datename">Numer pokoju:</label>
            <input type="text" id="datename" name="nrPokoju" required="required">
<#--            <input type="datetime-local" name="time_to" class="time-to" id="time-to" value="" onchange="calcTime(this.value)">-->
            <input type="datetime-local" name="time_to" class="time-to" id="time-to">
            <br>
            <button type="submit">Send</button>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</#macro>