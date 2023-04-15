/* 
    홀짝 게임

    - 주사위 2개를 굴려서 합의 홀 짝을 맞추는 게임

    - 베팅 룰

    - 홀 짝 : 홀수 또는 짝수를 맞출 경우 2배로 돌려줌(1 to 1)
    - 끗수 합(2~12) : 주사위 2개의 합 2,12(35 to 1), 3,11(17 to 1) 4,10(11 to 1) 5,9(7 to 1) 6,8(6.2 to 1) 7(5 to 1)
    - 끗수 차이(0~5) : 주사위 2개의 차이 0,3(5 to 1), 1(2 to 1), 2(3 to 1), 4(8 to 1), 5(17 to 1)
*/
const $cup = document.getElementById('cup');
const $dice1 = document.getElementById('dice1');
const $dice2 = document.getElementById('dice2');

const $betBtn = document.querySelector('.btn-betting'); // 베팅하기
const $startBtn = document.querySelector('.start'); // 시작하기
const $reStartBtn = document.querySelector('.restart'); // 다시하기
const $ruleBtn = document.querySelector('.rule.btn'); // 설명보기

let num1 = 1,num2 = 1;

$startBtn.onclick = function () {


    $startBtn.classList.add('blocked');
    // 랜덤 숫자 생성
    num1 = Math.floor(Math.random() * 6) + 1;
    num2 = Math.floor(Math.random() * 6) + 1;

    console.log('num1 = ' + num1);
    console.log('num2 = ' + num2);

    

    $cup.classList.add('action');

    setTimeout(() =>{
        $dice1.parentNode.classList.add('hide');
        $dice1.src = `../img/${num1}_dot.png`;
        $dice2.src = `../img/${num2}_dot.png`;
        }
    , 800);
    setTimeout(() => $dice1.parentNode.classList.remove('hide'), 3200);
    setTimeout(() => {
      $reStartBtn.classList.remove('blocked');
      ooeResult();
    }, 4000);
}

const $resultTxt = document.querySelector('.result-text');

function ooeResult(){
  const bTarget = document.querySelector('input[name="ooe-bet"]:checked');
  const bType = bTarget.dataset.bettingType;
  let flag = false;
  let result;
  if(bType === "ooe" ){
    result = (num1+num2)%2===0?'even':'odd';
    console.log(result);
  }else if(bType === "sum"){
    result = num1+num2;
  }else if(bType === "minus"){
    result = Math.abs(num1-num2);
  }
  $resultTxt.firstElementChild.textContent = `${num1} ${num2} ${(num1+num2)%2===0?'짝':'홀'}`;
  if(result==bTarget.dataset.select){
    $resultTxt.lastElementChild.textContent = `축하합니다`;
    $resultTxt.parentNode.lastElementChild.classList.remove('hide');
    flag = true;
  }else{
    $resultTxt.lastElementChild.textContent = `꽝`;
  }
  if(flag){
    total += Number($bettingCash.value) + Number($bettingCash.value)*Number(bTarget.dataset.rate);
  }else{
    total -= Number($bettingCash.value);
  }
  $textinput2.value = total + ' 원';
  $resultTxt.classList.remove('hide');

}


$reStartBtn.addEventListener('click',()=>{
    $cup.classList.remove('action');
    $startBtn.classList.add('blocked');
    $reStartBtn.classList.add('blocked');
    [...$bettings].forEach(c =>{
      c.classList.remove('blocked');
    });
    $resultTxt.classList.add('hide');
    $resultTxt.parentNode.lastElementChild.classList.add('hide');
});

$ruleBtn.addEventListener('click',()=>{
    console.log($ruleBtn.lastElementChild);
    $ruleBtn.lastElementChild.classList.toggle('hide');
});
const $bettings = document.querySelectorAll('.bet-odd-even,.bet-cash,.btn-betting');
const $bettingCash = document.getElementById('betting-cash');
$betBtn.addEventListener('click',() =>{
  if(!document.querySelector('input[name="ooe-bet"]:checked')){
    alert('베팅할 항목을 선택하세요');
}else if(total < $bettingCash.value){
    alert('잔액이 부족합니다');
}else{
    if(confirm('이대로 베팅하시겠습니까?')){
      [...$bettings].forEach(c =>{
        c.classList.add('blocked');
      });
      $startBtn.classList.remove('blocked');
    }
}
});
const $cashPlus = document.querySelector('.bet-cash .bet-plus');
const $castMinus = document.querySelector('.bet-cash .bet-minus');

$cashPlus.addEventListener('click',()=>{
  if(+$bettingCash.value>=200000){
      alert('최고 베팅금액은 200000원입니다.');
      return;
  }
  $bettingCash.value = +$bettingCash.value+10000;
});
$castMinus.addEventListener('click',()=>{
  if(+$bettingCash.value<=10000){
      alert('최소 베팅금액은 10000원입니다.');
      return;
  }
  $bettingCash.value = +$bettingCash.value-10000;
});





////////////////



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



const $no = document.querySelectorAll('.nothat');
console.log($no);

for(let $nothat of $no){
    $nothat.addEventListener('click', function(){
      alert('죄송합니다. 점검 중 입니다.');
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