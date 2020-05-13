document.addEventListener('turbolinks:load', function(){
    let single = document.querySelector('.single-test')
    let group = document.querySelector('.group-of-tests')

    if (single) {
        single.addEventListener('input', changeVisibility)
    }

    if (group) {
        group.addEventListener('input', changeVisibility)
    }
})

function changeVisibility() {
    let chooseCategoryLevel = document.querySelector('.choose-category-level')
    let chooseTest = document.querySelector('.choose-test')

    if (chooseTest.classList.contains('hide')) {
        chooseTest.classList.remove('hide')
        chooseCategoryLevel.classList.add('hide')
    } else {
        chooseTest.classList.add('hide')
        chooseCategoryLevel.classList.remove('hide')
    }
}