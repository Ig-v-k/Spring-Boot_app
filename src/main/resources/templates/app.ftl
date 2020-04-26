<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<#import "parts/logout.ftl" as lout>

<@c.page>
    <div>
        <@lout.logout />
    </div>
    <div>
        <form method="post">
            <input type="text" name="text" placeholder="Enter text" />
            <input type="text" name="tag" placeholder="Tag" >
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit">Add</button>
        </form>
    </div>
    <div>List text</div>
    <form method="get" action="/app">
        <input type="text" name="filter" value="${filter}">
        <button type="submit">Search</button>
    </form>
<#list messages as message>
    <div>
        <b>${message.id}</b>
        <span>${message.text}</span>
        <i>${message.tag}</i>
        <strong>${message.authorName}</strong>
    </div>
    <#else>
    No message
</#list>
</@c.page>
