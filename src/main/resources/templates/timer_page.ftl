<#import "parts/common.ftl" as cc>
<#include "parts/security.ftl">
<#import "parts/date_time_form.ftl" as dtf>

<@cc.page>

    <#if isAdmin>
        <@dtf.date_time_form_page/>
    </#if>

<#--
    <table id="usersList">
    </table>
    <script>
        function createUser() {

            console.info("method -- createUser() --");
            console.warn("method -- createUser() --");
            console.error("method -- createUser() --");

            // this.validationInputNumberForm();

            var nrPokojuHtml = document.getElementById("nrPokoju_form").value;
            var dateHtml = document.getElementById("time-to").value;

            var xmlhttp = new XMLHttpRequest();   // new HttpRequest instance
            xmlhttp.open("POST", "http://localhost:8080/app/save");
            xmlhttp.setRequestHeader("Content-Type", "application/json");
            xmlhttp.send(JSON.stringify({roomNumber: nrPokojuHtml, date: dateHtml}));

            loadUsers();
        }

        function validationInputNumberForm() {
            var x;

            x = document.getElementById("nrPokoju_form").value;

            if (isNaN(x) || x < 200 || x > 550) {
                createDivContentInvalidInputNumber(true);
            }
        }

        function createDivContentInvalidInputNumber(flag) {
            var divElement1;
            var pElement1;

            if(flag === true) {
                divElement1 = document.createElement("div");

                divElement1.setAttribute("class", "invalid-feedback");
                divElement1.setAttribute("id", "CustomInvalid-feedback");

                pElement1 = document.createElement("p")
                pElement1.innerText = "Invalid room number!";

                document.getElementById("invalid-datas").appendChild(divElement1);
                document.getElementById("CustomInvalid-feedback").appendChild(pElement1);
            }
        }

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
                            '<td>' + '<a href="/user/${user.username}">edit</a> &emsp;&emsp; <a href="/user/${user.username}/${user.id}">delete</a>' + '</td>';

                    }
                    document.getElementById("usersList").innerHTML = html;
                }
            };
            xhttp.open("GET", "http://localhost:8080/app/findAll", true);
            xhttp.send();
        }
    </script>
-->
</@cc.page>