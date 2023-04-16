
const $pCard1 = document.getElementById('pCard1');
const $pCard2 = document.getElementById('pCard2');
const $pCard3 = document.getElementById('pCard3');
const $bCard1 = document.getElementById('bCard1');
const $bCard2 = document.getElementById('bCard2');
const $bCard3 = document.getElementById('bCard3');
const $cards = [...document.querySelectorAll('.card')];

const $betBtn = document.querySelector('.btn-betting'); // 베팅하기
const $startBtn = document.querySelector('.start'); // 시작하기
const $reStartBtn = document.querySelector('.restart'); // 다시하기
const $ruleBtn = document.querySelector('.rule.btn'); // 설명보기

const $hit = document.getElementById('hit');
const $stand = document.getElementById('stand');

let rns = [6];
let pResult = 0;
let bResult = 0;

$startBtn.addEventListener('click',(e)=>{
  $startBtn.classList.add('blocked');
  fisrtDrawing();
  if(isNatural()){
    console.log('내추럴 있음');
    $hit.classList.add('blocked');
    $stand.classList.add('blocked');
    whoWin();
  }else{
    console.log('내추럴 없음');
    pAddTurn();
  }


});

function fisrtDrawing(){
  for(let i=1;i<=6;i++){
    rns[i] = Math.floor(Math.random() * 13) + 1;
  }
  console.log(rns);
  $pCard1.src = `../img/cards/${numbering(rns[0])+simbol()}.png`;
  $pCard1.classList.remove('hide');
  $pCard2.src = `../img/cards/${numbering(rns[1])+simbol()}.png`;
  $pCard2.classList.remove('hide');
  pResult = (numbering(rns[0])+numbering(rns[1]))%10
  $bCard1.src = `../img/cards/${numbering(rns[3])+simbol()}.png`;
  $bCard1.classList.remove('hide');
  $bCard2.src = `../img/cards/${numbering(rns[4])+simbol()}.png`;
  $bCard2.classList.remove('hide');
  bResult = (numbering(rns[3])+numbering(rns[4]))%10
  $resultTxt.lastElementChild.textContent = `${pResult} : ${bResult}`;
}

function numbering(n){
  if(n > 10){
    return 10;
  }else{
    return n;
  }
}

function isNatural(){
  console.log(pResult);
  console.log(bResult);
  if(pResult>=8 || bResult>=8){
    return true;
  }else{
    return false;
  }

}
function simbol(){
  let rn =Math.floor(Math.random() * 4) + 1;
  if(rn === 1){
    return 'c';
  }else if(rn === 2){
    return 'd';
  }else if(rn === 3){
    return 'h';
  }else if(rn === 4){
    return 's';
  }
}




function whoWin(){
  const bTarget = document.querySelector('input[name="baccart-bet"]:checked');
  const bType = bTarget.dataset.bettingType;

  console.log(bTarget);
  if(pResult===bResult){
    $resultTxt.firstElementChild.textContent = 'Draw';
    console.log('draw');
    if(bType==='tie'){
      total += Number($bettingCash.value) + Number($bettingCash.value) * Number(bTarget.dataset.rate);
    }else{
      total -= Number($bettingCash.value);
    }
  }else if(pResult>bResult){
    console.log('Player is Win');
    $resultTxt.firstElementChild.textContent = 'Player is Win';
    if(bType==='winner'){
      if(bTarget.dataset.select == 'player'){
        total += Number($bettingCash.value) + Number($bettingCash.value) * Number(bTarget.dataset.rate);
      }else{
        total -= Number($bettingCash.value);
      }
    }
  }else{
    console.log('Banker is Winner');
    $resultTxt.firstElementChild.textContent = 'Banker is Win';
    if(bType==='winner'){
      if(bTarget.dataset.select == 'banker'){
        if(bResult===6){
          total += Number($bettingCash.value) + Number($bettingCash.value) * 0.5;
        }else{
          total += Number($bettingCash.value) + Number($bettingCash.value) * Number(bTarget.dataset.rate);
        }
      }else{
        total -= Number($bettingCash.value);
      }
    }else if(bType==='six-banker'){
      if(bResult===6){
        total += Number($bettingCash.value) + Number($bettingCash.value) * Number(bTarget.dataset.rate);
      }else{
        total -= Number($bettingCash.value);
      }
    }
  }
  if(bType==='card'){
    if($pCard3.classList.contains('hide')&&$bCard3.classList.contains('hide')){
      console.log('스몰 조건');
      if(bTarget.dataset.select==='small'){
        console.log('스몰 조건 맞힘');
        total += Number($bettingCash.value) + Number($bettingCash.value) * Number(bTarget.dataset.rate);
      }else{
        console.log('스몰 틀림');
        total -= Number($bettingCash.value);
      }
    }else{
      console.log('빅 조건');
      if(bTarget.dataset.select==='big'){
        console.log('빅 조건 맞힘');
        total += Number($bettingCash.value) + Number($bettingCash.value) * Number(bTarget.dataset.rate);
      }else{
        console.log('빅 틀림');
        total -= Number($bettingCash.value);
      }
    }
  }
  if(bType==='pair'){
    if(bTarget.dataset.select==='player'){
      if(numbering($pCard1)===numbering($pCard2)){
        total += Number($bettingCash.value) + Number($bettingCash.value) * Number(bTarget.dataset.rate);
      }else{
        total -= Number($bettingCash.value);
      }
    }else{
      if(numbering($bCard1)===numbering($bCard2)){
        total += Number($bettingCash.value) + Number($bettingCash.value) * Number(bTarget.dataset.rate);
      }else{
        total -= Number($bettingCash.value);
      }
    }
  }
  $reStartBtn.classList.remove('blocked');

  $textinput2.value = total + ' 원';
  setCookie('money',`${total}`);
  $money.textContent = total + '원';
}

function pAddTurn(){
  if(pResult>=6){
    $hit.classList.remove('blocked');
    $stand.classList.remove('blocked');
  }else{
    $hit.classList.remove('blocked');
  }
}
function bAddTurn(){
  if($pCard3.classList.contains('hide')){
    // player stand일 경우
    if(bResult<6){
      bHit();
    }
  }else{
    // player hit일 경우
    if(bResult<=2){
      bHit();
    }else if(bResult === 3){
      if(!(numbering(rns[2])===8)){
        bHit();
      }
    }else if(bResult === 4){
      if(!(numbering(rns[2])===0||numbering(rns[2])===1||numbering(rns[2])===8||numbering(rns[2])===9)){
        bHit();
      }
    }else if(bResult === 5){
      if(numbering(rns[2])===4||numbering(rns[2])===5||numbering(rns[2])===6||numbering(rns[2])===7){
        bHit();
      }
    }else if(bResult === 6){
      if(numbering(rns[2])===6||numbering(rns[2])===7){
        bHit();
      }
    }else{
    }
  }
  $resultTxt.lastElementChild.textContent = `${pResult} : ${bResult}`;
  whoWin();
}
function bHit(){
  $bCard3.src = `../img/cards/${numbering(rns[5])+simbol()}.png`;
  $bCard3.classList.remove('hide');
  bResult = (numbering(rns[5])+bResult)%10;
}


$hit.addEventListener('click',()=>{
  $pCard3.src = `../img/cards/${numbering(rns[2])+simbol()}.png`;
  $pCard3.classList.remove('hide');
  pResult = (numbering(rns[2])+pResult)%10;
  $hit.classList.add('blocked');
  $stand.classList.add('blocked');
  $resultTxt.lastElementChild.textContent = `${pResult} : ${bResult}`;
  bAddTurn();
});
$stand.addEventListener('click',()=>{
  bAddTurn();
  $hit.classList.add('blocked');
  $stand.classList.add('blocked');
});
/////////////////////////////
const $resultTxt = document.querySelector('.result-text');
$reStartBtn.addEventListener('click', () => {
  $startBtn.classList.add('blocked');
  $reStartBtn.classList.add('blocked');
  [...$bettings].forEach(c => {
    c.classList.remove('blocked');
  });
  $resultTxt.firstElementChild.textContent = '';
  $resultTxt.lastElementChild.textContent = '';
  $resultTxt.parentNode.lastElementChild.classList.add('hide');
  $cards.forEach( card =>{
    card.classList.add('hide');
  });
});

$ruleBtn.addEventListener('click', () => {
  console.log($ruleBtn.lastElementChild);
  $ruleBtn.lastElementChild.classList.toggle('hide');
});
const $bettings = document.querySelectorAll('.bet-odd-even,.bet-cash,.btn-betting');
const $bettingCash = document.getElementById('betting-cash');

$betBtn.addEventListener('click', () => {
  
  if (!document.querySelector('input[name="baccart-bet"]:checked')) {
    alert('베팅할 항목을 선택하세요');
  } else if (total < $bettingCash.value) {
    alert('잔액이 부족합니다');
  } else {
    if (confirm('이대로 베팅하시겠습니까?')) {
      [...$bettings].forEach(c => {
        c.classList.add('blocked');
      });
      $startBtn.classList.remove('blocked');
    }
  }
});
const $cashPlus = document.querySelector('.bet-cash .bet-plus');
const $castMinus = document.querySelector('.bet-cash .bet-minus');

$cashPlus.addEventListener('click', () => {
  if (+$bettingCash.value >= 200000) {
    alert('최고 베팅금액은 200000원입니다.');
    return;
  }
  $bettingCash.value = +$bettingCash.value + 10000;
});
$castMinus.addEventListener('click', () => {
  if (+$bettingCash.value <= 10000) {
    alert('최소 베팅금액은 10000원입니다.');
    return;
  }
  $bettingCash.value = +$bettingCash.value - 10000;
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
      setCookie('money', total);
      $money.textContent = `잔액 : ${getCookie('money')}원`;
    }
  }
});



const $no = document.querySelectorAll('.nothat');
console.log($no);

for (let $nothat of $no) {
  $nothat.addEventListener('click', function () {
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
  for (let i = 0; i < cookiesArr.length; i++) {
    let cookies = cookiesArr[i].split('=');
    if (cookies[0] === key) {
      return cookies[1];
    }
  }
  return '';
}

function setCookie(key, value) {
  document.cookie = `${key}=${value}`;
}

window.addEventListener('load', () => {
  console.log(getCookie('user'));
  if (getCookie('user') === '') {
    alert('로그인부터 해주세요');
    window.open('./login.html', '_self');
  }
});

const $logout = document.querySelector('#user-logout');
$logout.addEventListener('click', () => {
  document.cookie = `user=${getCookie('user')}; max-age=-1;`;
  document.cookie = `money=${getCookie('money')}; max-age=-1;`;
  window.open('./login.html', '_self');
});