document.addEventListener('turbolinks:load', function () {
    var passwordConfirmation = document.querySelector('#user_password_confirmation')

    if (passwordConfirmation) {
        passwordConfirmation.addEventListener('input', comparePasswords)
    }
})

function comparePasswords() {
    var pass = document.querySelector('#user_password')


    if (this.value === pass.value) {
        this.parentElement.querySelector('.octicon-check').classList.remove('hide')
        this.parentElement.querySelector('.octicon-x').classList.add('hide')
    } else if (!this.value) {
        this.parentElement.querySelector('.octicon-x').classList.add('hide')
        this.parentElement.querySelector('.octicon-check').classList.add('hide')
    } else {
        this.parentElement.querySelector('.octicon-x').classList.remove('hide')
        this.parentElement.querySelector('.octicon-check').classList.add('hide')
    }
}