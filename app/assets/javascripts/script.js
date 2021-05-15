var $answeredBtn = document.querySelector('.answered_btn');
var $unansweredBtn = document.querySelector('.unanswered_btn');
var $answered = document.querySelectorAll('.answered');
var $unanswered = document.querySelectorAll('.unanswered');
var $allBtn = document.querySelector('.all_btn');

console.log('hello');


$allBtn.addEventListener('click', function() {
    $unanswered.forEach(function(a) {
        a.classList.remove("d-none");
        a.classList.add("d-block");
    })
    $answered.forEach(function(a) {
        a.classList.add("d-block");
        a.classList.remove("d-none");
    });
});

$unansweredBtn.addEventListener('click', function() {
    $unanswered.forEach(function(a) {
        a.classList.remove("d-none");
        a.classList.add("d-block");
    })
    $answered.forEach(function(a) {
        a.classList.remove("d-block");
        a.classList.add("d-none");
    });
});



$answeredBtn.addEventListener('click', function() {
    $unanswered.forEach(function(a) {
        a.classList.add("d-none");
        a.classList.remove("d-block");
    })
    $answered.forEach(function(a) {
        a.classList.add("d-block");
        a.classList.remove("d-none");
    });
});