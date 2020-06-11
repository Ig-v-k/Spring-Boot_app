<#import "parts/common.ftl" as c>

<@c.page>
    <h2>${username}</h2>
    ${message?ifExists}
    <form method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password:</label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" required="required" placeholder="Password" />
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Room number:</label>
            <div class="col-sm-6">
                <input required="required" type="number" name="roomNumber" class="form-control" placeholder="000" value="${roomNumber!''}" step="1" min="200" max="550" />
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Card number:</label>
            <div class="col-sm-6">
                <input required="required" type="number" name="cardNumber" class="form-control" placeholder="0000" value="${cardNumber!''}" step="1" min="3000" max="4000" />
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">Save</button>
    </form>
</@c.page>