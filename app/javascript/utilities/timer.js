document.addEventListener('turbolinks:load', function () {
    let control = document.querySelector('.timer')

    if (control) {
        let countDownDate = new Date(control.dataset.timerFinish)
        let x = setInterval(function () {
            let now = new Date().getTime()
            let distance = countDownDate - now
            let minutes = Math.floor(distance / (1000 * 60))
            let seconds = Math.floor(distance % (1000 * 60) / 1000)
            control.innerHTML = minutes + "m " + seconds + "s"

            if (distance < 0) {
                document.querySelector("form").submit()
            }
        }, 1000)
    }
})