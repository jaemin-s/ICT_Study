

const $button = document.querySelector('button');
console.log($button);
const $textinput = document.querySelector('.dust-class > #itempw');
console.log($textinput);        
const $textinput2 = document.querySelector('.dust-class.ver2 > #itemnew');
console.log($textinput2);


$button.addEventListener('click', function() { 
    if($textinput.value === '') {
        alert('충전 금액을 입력해 주세요!');
        return;
    }
});