<#import "parts/common.ftl" as cc>
<#include "parts/security.ftl">
<#import "parts/date_time_form.ftl" as dtf>

<@cc.page>

    <#if isAdmin>
        <@dtf.date_time_form_page/>
    </#if>

</@cc.page>