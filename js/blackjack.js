const $cards = [...document.querySelectorAll('.card')];

const $betBtn = document.querySelector('.btn-betting'); // 베팅하기
const $startBtn = document.querySelector('.start'); // 시작하기
const $reStartBtn = document.querySelector('.restart'); // 다시하기
const $ruleBtn = document.querySelector('.rule.btn'); // 설명보기

const $hit = document.getElementById('hit');
const $stand = document.getElementById('stand');

let pResult = 0;
let dResult = 0;

let pCards = []
let dCards = []

$startBtn.addEventListener('click',(e)=>{
  $startBtn.classList.add('blocked');
  fisrtDrawing();
  if(isBlackjack(pResult)||isBlackjack(dResult)){
    $hit.classList.add('blocked');
    $stand.classList.add('blocked');
    if(pResult===dResult){
        // 블랙잭 무승부
        $resultTxt.firstElementChild.textContent = 'Draw';
    }else if(isBlackjack(pResult)){
        // 플레이어 블랙잭 승
        $resultTxt.firstElementChild.textContent = 'Player is BlackJack';
        total += Number($bettingCash.value) + Number($bettingCash.value) * 1.5;
        $resultTxt.parentNode.lastElementChild.classList.remove('hide');
    }else{
        // 딜러 블랙잭 승
        $resultTxt.firstElementChild.textContent = 'Dealer is BlackJack';
        total -= Number($bettingCash.value);
    }
    $textinput2.value = total + ' 원';
    setCookie('money',`${total}`);
    $money.textContent = total + '원';
    $reStartBtn.classList.remove('blocked');
  }else{
    $hit.classList.remove('blocked');
    $stand.classList.remove('blocked');
  }
});

function fisrtDrawing(){
    addPlayerCard();
    addPlayerCard();
    addDealerCard();
    addDealerCard();
    pResult = numbering(pCards[0])+numbering(pCards[1]);
    dResult = numbering(dCards[0])+numbering(dCards[1]);
    $resultTxt.lastElementChild.textContent = `${pResult} : ${dResult}`;
}
function addPlayerCard(){
    pCards.push(Math.floor(Math.random() * 13) + 1);
    document.querySelector(`.cards.player-side`).insertAdjacentHTML('beforeend',`<img src="../img/cards/${pCards[pCards.length-1]}${simbol()}.png" alt="card" class="card">`);
}
function addDealerCard(){
    dCards.push(Math.floor(Math.random() * 13) + 1);
    document.querySelector(`.cards.dealer-side`).insertAdjacentHTML('beforeend',`<img src="../img/cards/${dCards[dCards.length-1]}${simbol()}.png" alt="card" class="card">`);
}
function numbering(n){
    if(n === 1){
        return 11;
    }else if(n > 10){
        return 10;
    }else{
        return n;
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

function isBlackjack(num){
    if(num === 21){
        return true;
    }else{
        return false;
    }
}

$hit.addEventListener('click',()=>{
    addPlayerCard();
    pResult = pResult+numbering(pCards[pCards.length-1]);
    $resultTxt.lastElementChild.textContent = `${pResult} : ${dResult}`;
    if(pResult===21){
        $hit.classList.add('blocked');
        $stand.classList.add('blocked');
        dealerTurn();
        if(Math.abs(21-pResult)===Math.abs(21-dResult)){
            $resultTxt.firstElementChild.textContent = 'Draw';
        }else{
            $resultTxt.firstElementChild.textContent = 'Player is Win!';
            $resultTxt.parentNode.lastElementChild.classList.remove('hide');
            win();
        }
        $reStartBtn.classList.remove('blocked');
    }else if(pResult>21){
        $hit.classList.add('blocked');
        $stand.classList.add('blocked');
        console.log('bust~');
        $resultTxt.firstElementChild.textContent = 'Player Bust!';
        $reStartBtn.classList.remove('blocked');
        total -= Number($bettingCash.value);
        $textinput2.value = total + ' 원';
        setCookie('money',`${total}`);
        $money.textContent = total + '원';
    }
});

$stand.addEventListener('click',()=>{
    $hit.classList.add('blocked');
    $stand.classList.add('blocked');
    dealerTurn();
    console.log(dResult>21);
    if(!(dResult>21)){
        console.log('들어옴');
        if(Math.abs(21-pResult)===Math.abs(21-dResult)){
            // 무승부
            $resultTxt.firstElementChild.textContent = 'Draw';
        }else if(Math.abs(21-pResult)<Math.abs(21-dResult)){
            // 플레이어 승리
            $resultTxt.firstElementChild.textContent = 'Player is Win!';
            $resultTxt.parentNode.lastElementChild.classList.remove('hide');
            total += Number($bettingCash.value) + Number($bettingCash.value) * 1;
        }else{
            $resultTxt.firstElementChild.textContent = 'Dealer is Win!';
            total -= Number($bettingCash.value);
        }
    }
    $reStartBtn.classList.remove('blocked');
    $textinput2.value = total + ' 원';
    setCookie('money',`${total}`);
    $money.textContent = total + '원';
});

function dealerTurn(){
        while(dResult<17){
            addDealerCard();
            dResult = dResult+numbering(dCards[dCards.length-1]);
            $resultTxt.lastElementChild.textContent = `${pResult} : ${dResult}`;
        }
        if(dResult>21){
            $resultTxt.firstElementChild.textContent = 'Dealer Bust!';
            $resultTxt.parentNode.lastElementChild.classList.remove('hide');
            $reStartBtn.classList.remove('blocked');
            total += Number($bettingCash.value) + Number($bettingCash.value) * 1;
        }
}

function lose(){
    total -= Number($bettingCash.value);
    $textinput2.value = total + ' 원';
    setCookie('money',`${total}`);
    $money.textContent = total + '원';
}

function win(){
    total += Number($bettingCash.value) + Number($bettingCash.value) * 1;
    $textinput2.value = total + ' 원';
    setCookie('money',`${total}`);
    $money.textContent = total + '원';
}
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
  [...document.querySelectorAll('.card')].forEach( card =>{
    card.remove();
  });
  pCards = [];
  dCards = [];
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