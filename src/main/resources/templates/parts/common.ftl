<#macro page>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>LaundryKey</title>
        <link rel="stylesheet" href="/static/style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="theme-color" content="#563d7c">

        <style type="text/css">

            .iw-contextMenu {
                box-shadow: 0px 2px 3px rgba(0, 0, 0, 0.10) !important;
                border: 1px solid #c8c7cc !important;
                border-radius: 11px !important;
                display: none;
                z-index: 1000000132;
                max-width: 300px !important;
                width: auto !important;
            }

            .dark-mode .iw-contextMenu,
            .TnITTtw-dark-mode.iw-contextMenu,
            .TnITTtw-dark-mode .iw-contextMenu {
                border-color: #747473 !important;
            }

            .iw-cm-menu {
                background: #fff !important;
                color: #000 !important;
                margin: 0px !important;
                padding: 0px !important;
                overflow: visible !important;
            }

            .dark-mode .iw-cm-menu,
            .TnITTtw-dark-mode.iw-cm-menu,
            .TnITTtw-dark-mode .iw-cm-menu {
                background: #525251 !important;
                color: #FFF !important;
            }

            .iw-curMenu {
            }

            .iw-cm-menu li {
                font-family: -apple-system, BlinkMacSystemFont, "Helvetica Neue", Helvetica, Arial, Ubuntu, sans-serif !important;
                list-style: none !important;
                padding: 10px !important;
                padding-right: 20px !important;
                border-bottom: 1px solid #c8c7cc !important;
                font-weight: 400 !important;
                cursor: pointer !important;
                position: relative !important;
                font-size: 14px !important;
                margin: 0 !important;
                line-height: inherit !important;
                border-radius: 0 !important;
                display: block !important;
            }

            .dark-mode .iw-cm-menu li, .TnITTtw-dark-mode .iw-cm-menu li {
                border-bottom-color: #747473 !important;
            }

            .iw-cm-menu li:first-child {
                border-top-left-radius: 11px !important;
                border-top-right-radius: 11px !important;
            }

            .iw-cm-menu li:last-child {
                border-bottom-left-radius: 11px !important;
                border-bottom-right-radius: 11px !important;
                border-bottom: none !important;
            }

            .iw-mOverlay {
                position: absolute !important;
                width: 100% !important;
                height: 100% !important;
                top: 0px !important;
                left: 0px !important;
                background: #FFF !important;
                opacity: .5 !important;
            }

            .iw-contextMenu li.iw-mDisable {
                opacity: 0.3 !important;
                cursor: default !important;
            }

            .iw-mSelected {
                background-color: #F6F6F6 !important;
            }

            .dark-mode .iw-mSelected, .TnITTtw-dark-mode .iw-mSelected {
                background-color: #676766 !important;
            }

            .iw-cm-arrow-right {
                width: 0 !important;
                height: 0 !important;
                border-top: 5px solid transparent !important;
                border-bottom: 5px solid transparent !important;
                border-left: 5px solid #000 !important;
                position: absolute !important;
                right: 5px !important;
                top: 50% !important;
                margin-top: -5px !important;
            }

            .dark-mode .iw-cm-arrow-right, .TnITTtw-dark-mode .iw-cm-arrow-right {
                border-left-color: #FFF !important;
            }

            .iw-mSelected > .iw-cm-arrow-right {
            }
        </style>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/sign-in/">
        <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/floating-labels/">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    </head>
    <body class="text-center">
    <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
        <#include "navbar.ftl">
        <div class="container mt-5">
            <#nested>
        </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </body>
    </html>
</#macro>