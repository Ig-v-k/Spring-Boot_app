<#import "parts/common_key.ftl" as cc>
<#include "parts/security.ftl">
<#import "parts/date_time_form.ftl" as dtf>

<@cc.page>

    <#if isAdmin>
        <@dtf.date_time_form_page/>
    </#if>

    <#if timeUsersList??>
        <table class="table table-borderless" id="table_times">
            <thead>
            <tr>
                <th scope="col">Room number</th>
                <th scope="col">Time to return</th>
                <th scope="col"> </th>
            </tr>
            </thead>
            <tbody>
            <#list timeUsersList as user>
                <tr id="tr_time">
                    <td>${user.roomNumber}</td>
                    <td><#if user.date??>${user.date}<#else>---</#if></td>
                    <td><a href="/user/${user.username}">edit</a> &emsp;&emsp; <a href="/user/${user.username}/${user.id}">delete</a></td>
                </tr>
            </#list>
            </tbody>
        </table>
    </#if>

</@cc.page>