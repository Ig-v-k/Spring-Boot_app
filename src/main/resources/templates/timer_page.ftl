<#import "parts/common_key.ftl" as cc>
<#include "parts/security.ftl">
<#import "parts/date_time_form.ftl" as dtf>

<@cc.page>

    <#if isAdmin>
        <@dtf.date_time_form_page/>
        <h3 id="asdasd"></h3>
    </#if>

    <br><br>

    <div class="container">
        <h1>Countdown time:</h1>
        <ul>
            <li><span id="days"></span>days</li>
            <li><span id="hours"></span>Hours</li>
            <li><span id="minutes"></span>Minutes</li>
            <li><span id="seconds"></span>Seconds</li>
        </ul>
    </div>

    <script>
        document.getElementById('asdasd').innerText = "<#if _date1??>${_date1}<#else>empty</#if>";
        var date_date = "<#if _date1??>${_date1}</#if>";

        loadEventListeners();

        function loadEventListeners() {
            document.addEventListener('DOMContentLoaded', function() { calcTime(date_date); });
        };

        // deleted -> timeTo = document.getElementById('time-to').value
        var date,
            now = new Date(),
            newYear = new Date('1.1.2020').getTime(),
            startTimer = '';

        // calculate date, hour, minute and second
        function calcTime(date_date) {
            //ui variables
            clearInterval(startTimer);

            if(typeof(date_date) == 'undefined'){
                date = new Date(newYear).getTime();
            }else {
                date = new Date(date_date).getTime();
            }

            function updateTimer(date){

                var now = new Date().getTime();
                var distance = date - now;

                // Time calculations for days, hours, minutes and seconds
                var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                // select element
                document.getElementById('days').innerText = days;
                document.getElementById('hours').innerText = hours;
                document.getElementById('minutes').innerText = minutes;
                document.getElementById('seconds').innerText = seconds;

                if(now >= date){
                    clearInterval(startTimer);
                    document.getElementById('days').innerText = '0';
                    document.getElementById('hours').innerText = '0';
                    document.getElementById('minutes').innerText = '0';
                    document.getElementById('seconds').innerText = '0';
                }
            }

            startTimer = setInterval(function() {
                updateTimer(date);
                }, 1000);

        }

        //

        // const second = 1000,
        //     minute = second * 60,
        //     hour = minute * 60,
        //     day = hour * 24;
        //
        // let countDown = new Date('Sep 30, 2020 00:00:00').getTime(), x = setInterval(function() {
        //
        //         let now = new Date().getTime(), distance = countDown - now;
        //
        //         document.getElementById('days').innerText = Math.floor(distance / (day)),
        //             document.getElementById('hours').innerText = Math.floor((distance % (day)) / (hour)),
        //             document.getElementById('minutes').innerText = Math.floor((distance % (hour)) / (minute)),
        //             document.getElementById('seconds').innerText = Math.floor((distance % (minute)) / second);
        //
        //         if(now >= date){
        //             clearInterval(startTimer);
        //             document.querySelector('.clock-day').innerHTML = 'D';
        //             document.querySelector('.clock-hours').innerHTML = 'O';
        //             document.querySelector('.clock-minutes').innerHTML = 'N';
        //             document.querySelector('.clock-seconds').innerHTML = 'E';
        //         }
        //
        //     }, second)
    </script>
</@cc.page>