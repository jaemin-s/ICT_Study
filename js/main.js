

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
let total = +getCookie('money');
$textinput2.value = total + ' 원';

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
      setCookie('money',total);
      $money.textContent = `잔액 : ${getCookie('money')}원`;
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



////

const $id = document.getElementById('user-id');
const $money = document.getElementById('user-money');

$id.textContent = `ID : ${getCookie('user')}`;
$money.textContent = `잔액 : ${getCookie('money')}원`;

function getCookie(key) {
    let cookiesArr = document.cookie.split('; ');
    for(let i=0;i<cookiesArr.length;i++){
        let cookies = cookiesArr[i].split('=');
        if(cookies[0]===key) {
            return cookies[1];
        }
    }
    return '';
}

function setCookie(key,value){
    document.cookie = `${key}=${value}`;
}

function cookieExists(key){
    if(getCookie(key)===''){
        alert('로그인부터 해주세요');
        window.open('./login.html');
    }
}