<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
        <div class="alert alert-danger" role="alert">
            <#if Session.SPRING_SECURITY_LAST_EXCEPTION.message??>${Session.SPRING_SECURITY_LAST_EXCEPTION.message}<#else>ERROR</#if>
        </div>
    </#if>
    <@l.login "/login" false/>
</@c.page>