<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand d-md-none d-inline" href="/">LaundryKey</a>
<#--    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">-->
<#--        <span class="navbar-toggler-icon"></span>-->
<#--    </button>-->
    <button class="navbar-toggler ml-1" type="button" data-toggle="collapse" data-target="#collapsingNavbar2">
        <span class="navbar-toggler-icon"></span>
    </button>

<#--    <a class="nav-link" href="#_"><i class="fa fa-search mr-1"></i></a>-->
    <div class="navbar-collapse collapse justify-content-between align-items-center w-100" id="collapsingNavbar2">
        <ul class="navbar-nav mx-auto text-md-center text-left">
            <li class="nav-item my-auto">
                <a class="nav-link navbar-brand mx-0 d-none d-md-inline" href="/">LaundryKey</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/">Home</a>
            </li>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/user">User list</a>
                </li>
            </#if>
<#--            <#if user??>-->
<#--                <li class="nav-item">-->
<#--                    <a class="nav-link" href="/user/profile">Profile</a>-->
<#--                </li>-->
<#--            </#if>-->
            <li class="nav-item">
                <a class="nav-link" href="/app">Key</a>
            </li>
        </ul>
        <div class="navbar-text mr-3">${name}</div>
        <@l.logout />

<#--    <div class="collapse navbar-collapse" id="navbarSupportedContent">-->
<#--        <ul class="navbar-nav mr-auto">-->
<#--            <li class="nav-item">-->
<#--                <a class="nav-link" href="/">Home</a>-->
<#--            </li>-->
<#--            <li class="nav-item">-->
<#--                <a class="nav-link" href="/app">Messages</a>-->
<#--            </li>-->
<#--            <#if isAdmin>-->
<#--                <li class="nav-item">-->
<#--                    <a class="nav-link" href="/user">User list</a>-->
<#--                </li>-->
<#--            </#if>-->
<#--            <#if user??>-->
<#--                <li class="nav-item">-->
<#--                    <a class="nav-link" href="/user/profile">Profile</a>-->
<#--                </li>-->
<#--            </#if>-->
<#--        </ul>-->

<#--        <div class="navbar-text mr-3">${name}</div>-->
<#--        <@l.logout />-->
    </div>
</nav>