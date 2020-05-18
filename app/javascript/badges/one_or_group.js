document.addEventListener('turbolinks:load', function () {

    let hide = document.querySelectorAll('.parameter')
    for (i = 1; i < hide.length; i++) {
        hide[i].remove()
    }

    let control = document.querySelector('#badge_rule')

    if (control) {
        control.addEventListener('input', function () {
            changeVisibility(hide)
        })
    }

})

function changeVisibility(hide) {
    let selectedType = document.querySelector('#badge_rule').value
    let control = document.querySelector('.choosing-parameter')
    for (i=0; i < hide.length; i++) {
        if (!hide[i].classList.contains(`${selectedType}`)) {
            hide[i].remove()
        } else {
            control.appendChild(hide[i])
        }
    }
}