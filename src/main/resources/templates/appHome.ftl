<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
    <#if !user??>
        <h5>Hello, <#if user??>${name}<#else>guest</#if></h5>
        <div>This page contains a list of users who currently have a Laundry key</div>
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
                    <#if isAdmin><td><a href="/user/${user.username}">edit</a> &emsp;&emsp; <a href="/user/${user.username}/${user.roomNumber}">delete</a></td></#if>
                </tr>
            </#list>
            </tbody>
        </table>
    </#if>

</@c.page>