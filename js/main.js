

// const $button = document.querySelector('button');
// console.log($button);
// const $textinput = document.querySelector('.dust-class > #itempw');
// console.log($textinput);        
// const $textinput2 = document.querySelector('.dust-class.ver2 > #itemnew');
// console.log($textinput2);


// $button.addEventListener('click', function() { 
//     if($textinput.value === '') {
//         alert('충전 금액을 입력해 주세요!');
//         return;
//     }
// });
const $button = document.querySelector('button');
console.log($button);
const $textinput = document.querySelector('.dust-class > #itempw');
console.log($textinput);
let $textinput2 = document.querySelector('.dust-class.ver2 > #itemnew');
console.log($textinput2);
let total = 0;

$button.addEventListener('click', function () {
  if ($textinput.value === '') {
    alert('충전 금액을 입력해 주세요.');
  } else {
    if (isNaN($textinput.value)) {
      alert('금액이 잘못되었습니다.');
      $textinput.value = '';
      return;
    } else {
      total += Number($textinput.value);
      $textinput.value = '';
      $textinput2.value = total + ' 원';
    }
  }
});


const $no = document.querySelectorAll('.top-menu .nothat');
console.log($no);

for(let $nothat of $no){
    $nothat.addEventListener('click', function(){
        alert('죄송합니다. 점검 중 입니다.');
    })
};

const $nothat = document.querySelectorAll('.picture .nothat1');

for(let $nothat2 of $nothat){
    $nothat2.addEventListener('click', function(){
        alert('죄송합니다. 다른 게임을 이용 해주세요');
    })
};