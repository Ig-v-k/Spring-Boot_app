<#import "parts/common.ftl" as c>
<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/app" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by text">
                <button type="submit" class="btn btn-primary ml-2">Search</button>
            </form>
        </div>
    </div>

    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new Message
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control" name="text" placeholder="Enter the text" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="tag" placeholder="Tag">
                </div>
<#--                <div class="form-group">-->
<#--                    <div class="custom-file">-->
<#--                        <input type="file" name="file" id="customFile">-->
<#--                        <label class="custom-file-label" for="customFile">Choose file</label>-->
<#--                    </div>-->
<#--                </div>-->
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Add</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card-columns">
        <#list messages as message>
            <div class="card my-3">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <span>${message.text}</span>
                    <i>${message.tag}</i>
                </div>
                <div class="card-footer text-muted">
                    ${message.authorName}
                </div>
            </div>
        <#else>
            No message
        </#list>
    </div>

    <h1>Clock</h1>
    <div id="clockdiv">
<#--        <div>-->
<#--            <span class="days" id="day"></span>-->
<#--            <div class="smalltext">Days</div>-->
<#--        </div>-->
        <div>
            <span class="hours" id="hour"></span>
            <div class="smalltext">Hours</div>
        </div>
        <div>
            <span class="minutes" id="minute"></span>
            <div class="smalltext">Minutes</div>
        </div>
        <div>
            <span class="seconds" id="second"></span>
            <div class="smalltext">Seconds</div>
        </div>
    </div>

    <div>time 1 | <span id="time1">05:00</span> minutes!</div>

    <div>time 2 | <span id="time2"></span> minutes!</div>

    <p id="demo"></p>

    <script>

        var deadline = new Date("may 7, 2020 15:37:25").getTime();

        var x = setInterval(function() {

            var now = new Date().getTime();
            var t = deadline - now;
            // var days = Math.floor(t / (1000 * 60 * 60 * 24));
            var hours = Math.floor((t%(1000 * 60 * 60 * 24))/(1000 * 60 * 60));
            var minutes = Math.floor((t % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((t % (1000 * 60)) / 1000);
            // document.getElementById("day").innerHTML =days ;
            document.getElementById("hour").innerHTML =hours;
            document.getElementById("minute").innerHTML = minutes;
            document.getElementById("second").innerHTML =seconds;
            if (t < 0) {
                clearInterval(x);
                document.getElementById("demo").innerHTML = "TIME UP";
                // document.getElementById("day").innerHTML ='0';
                document.getElementById("hour").innerHTML ='0';
                document.getElementById("minute").innerHTML ='0' ;
                document.getElementById("second").innerHTML = '0'; }
        }, 1000);
        //
        function startTimer1(duration, display) {
            var timer = duration, minutes, seconds;
            setInterval(function () {
                minutes = parseInt(timer / 60, 10)
                seconds = parseInt(timer % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                display.textContent = minutes + ":" + seconds;

                if (--timer < 0) {
                    timer = duration;
                }
            }, 1000);
        }

        window.onload = function () {
            var fiveMinutes = 60 * 5,
                display = document.querySelector('#time1');
            startTimer1(fiveMinutes, display);
        };
        //
        function startTimer2(duration, display) {
            var start = Date.now(),
                diff,
                minutes,
                seconds;
            function timer() {
                // get the number of seconds that have elapsed since
                // startTimer() was called
                diff = duration - (((Date.now() - start) / 1000) | 0);

                // does the same job as parseInt truncates the float
                minutes = (diff / 60) | 0;
                seconds = (diff % 60) | 0;

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                display.textContent = minutes + ":" + seconds;

                if (diff <= 0) {
                    // add one second so that the count down starts at the full duration
                    // example 05:00 not 04:59
                    start = Date.now() + 1000;
                }
            };
            // we don't want to wait a full second before the timer starts
            timer();
            setInterval(timer, 1000);
        }

        window.onload = function () {
            var fiveMinutes = 60 * 5,
                display = document.querySelector('#time2');
            startTimer2(fiveMinutes, display);
        };
    </script>



</@c.page>