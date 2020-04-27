<#import "parts/common.ftl" as c>

<@c.page>
    <h3>List of users</h3>
    <br>
    <table class="table table-borderless">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Name</th>
            <th scope="col">Roles</th>
            <th scope="col"> </th>
        </tr>
        </thead>
        <tbody>
            <#list users as user>
                <tr>
                    <th scope="row">${user.id}</th>
                    <td>${user.username}</td>
                    <td><#list user.roles as role>${role}<#sep>, </#list></td>
                    <td><a href="/user/${user.id}">edit</a></td>
                </tr>
            </#list>
        </tbody>
    </table>

</@c.page>