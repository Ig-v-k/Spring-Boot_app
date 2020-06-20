<#macro date_time_form_page>
<#--    <form action="/ttime" method="post">-->
    <form>
        <div class="container">
            <h3>Time for key:</h3>
            <br>
            <div class="input-group input-group-lg">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-lg">Nr.</span>
                </div>
                <input <#if userRoomNumberForEdit??>value="${userRoomNumberForEdit}"</#if> required id="nrPokoju_form" step="1" min="200" max="550" placeholder="000" type="number"
                       name="roomNumberForm" class="form-control ${(userRoomError??)?string('is-invalid', '')}"
                       aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
                <div class="row">
                    <div id="invalid-success-div-feedback response-from-server" class="col">

                    </div>
                </div>
<#--
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
-->
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
<#--                    <button class="btn btn-primary" type="submit">Send</button>-->
                    <button class="btn btn-primary" type="button" onclick="createTimeOfTheForm('http://localhost:8080/ajax/ttimeAjax', validationInputNumberForm)">Send</button>
                </div>
            </div>
        </div>
        <input id="csrfTokenForm" type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>

    <script>
        function createTimeOfTheForm(url, cFunction) {

            console.info("method -- createUser() --");

            var roomNumberFormTime = document.getElementById("nrPokoju_form").value;
            var dateHtmlForm = document.getElementById("time-toId").value;

            var csrfToken = $("meta[name='_csrf']").attr("content");

            console.warn("nrPokojuHtmlForm ---> " + roomNumberFormTime);
            console.warn("dateHtmlForm ---> " + dateHtmlForm);

            var xmlhttp;
            var o = XMLHttpRequest.prototype.open;
            XMLHttpRequest.prototype.open = function(){
                var res = o.apply(this, arguments);
                var err = new Error();
                xmlhttp.setRequestHeader("X-CSRF-TOKEN", csrfToken);
                return res;
            }

            xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    cFunction(this);
                }
            };

            xmlhttp.open("POST", url, true);
            xmlhttp.setRequestHeader("Content-type", "application/json");
            xmlhttp.send(JSON.stringify({roomNumber: roomNumberFormTime, date: dateHtmlForm}));
        }

        function validationInputNumberForm(xmlhttp) {

            console.warn("xmlhttp --> " + xmlhttp.responseText)

            if(xmlhttp.responseText === "false"){
                createDivContentInvalidInputNumber("error")
            }
            if (xmlhttp.responseText === "true") {
                createDivContentInvalidInputNumber("success")
            }
        }

        function createDivContentInvalidInputNumber(typeResult) {

            console.warn("typeResult --> " + typeResult)

            var divElement1 = document.createElement('div');
            var pElement1 = document.createElement('p')

            if(typeResult === "error") {

                console.info("method -- createDivContentInvalidInputNumber() - error --")
                divElement1.setAttribute('class', "alert alert-danger");
                divElement1.setAttribute('role', "alert");
                pElement1.innerText = "Can't find this room number!";
                document.getElementById("invalid-success-div-feedback response-from-server").appendChild(divElement1);
                divElement1.appendChild(pElement1);

            }
            if(typeResult === "success") {

                console.info("method -- createDivContentInvalidInputNumber() - success --")
                divElement1.setAttribute('class', "alert alert-success");
                divElement1.setAttribute('role', "alert");
                pElement1.innerText = "Time to added successfully!";
                document.getElementById("invalid-success-div-feedback response-from-server").appendChild(divElement1);
                divElement1.appendChild(pElement1);

            }
        }

/*
        function loadUsers() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var users = JSON.parse(this.responseText);
                    var html = '<tr>\n' +
                        '        <th>Room number</th>\n' +
                        '        <th>Time to return</th>\n' +
                        '        <th> </th>\n' +
                        '    </tr>';
                    for (var i = 0; i < users.length; i++) {
                        var user = users[i];
                        console.log(user);
                        html = html + '<td>' + user.roomNumber + '</td>\n' +
                            '<td>' + user.date + '</td>\n' +
                            '<td>' + '<a href="/user/<#--${user.username}-->">edit</a> &emsp;&emsp; <a href="/user/<#--${user.username}-->/<#--${user.id}-->">delete</a>' + '</td>';

                    }
                    document.getElementById("usersList").innerHTML = html;
                }
            };
            xhttp.open("GET", "http://localhost:8080/app/findAll", true);
            xhttp.send();
        }
*/
    </script>
</#macro>