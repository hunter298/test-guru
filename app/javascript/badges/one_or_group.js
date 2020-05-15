document.addEventListener('turbolinks:load', function () {


    let hide = document.querySelectorAll('.choose-parameter')
    for (i = 1; i < hide.length; i++) {
        hide[i].remove()
    }
    let controls = document.querySelectorAll('.badge-for')

    if (controls.length) {
        for (i = 0; i < controls.length; i++) {
            let type = controls[i].dataset.parameter
            controls[i].addEventListener('input', function() {
                changeVisibility(hide, type)
            })
        }
    }


})

function changeVisibility(hide, type) {


    let control = document.querySelector('.choosing-parameter')

    for (i = 0; i < hide.length; i++) {
        if (hide[i].dataset.parameterType != type) {
            hide[i].remove()
        } else {
            control.appendChild(hide[i])
            hide[i].classList.remove('hide')
        }
    }
}