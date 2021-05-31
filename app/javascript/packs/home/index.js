var hide = function() {
    document.querySelectorAll(this.showSelector).forEach(element => {
        element.classList.add("d-none");
    });
}

var show = function() {
    document.querySelectorAll(this.showSelector).forEach(element => {
        element.classList.remove("d-none");
    });
}

document.querySelector('.answered_btn').addEventListener('click', { showSelector: '.answered', handleEvent: show });
document.querySelector('.answered_btn').addEventListener('click', { showSelector: '.unanswered', handleEvent: hide });

document.querySelector('.unanswered_btn').addEventListener('click', { showSelector: '.answered', handleEvent: hide });
document.querySelector('.unanswered_btn').addEventListener('click', { showSelector: '.unanswered', handleEvent: show });

document.querySelector('.all_btn').addEventListener('click', { showSelector: '.answered', handleEvent: show });
document.querySelector('.all_btn').addEventListener('click', { showSelector: '.unanswered', handleEvent: show });