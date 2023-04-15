const $spinBtn = document.querySelector('.start.btn');
const $resetBtn = document.querySelector('.restart.btn');
const $ball = document.querySelector('.ball-location');
const spinAni = document.styleSheets[0].cssRules[1];
const $display = document.querySelector('#roulette .display-box p');
const $showResult = document.querySelector('.showResult');

$spinBtn.addEventListener('click',()=>{
    let rn = Math.floor(Math.random()*1080)+3600;
    spinAni.appendRule(`100%{ transform : rotate(${rn}deg); height: 488px;}`);
    $ball.classList.add('spin');
    $spinBtn.classList.add('blocked');
    setTimeout(function(){
        whatNumber(rn%360);
        showrn();
        showResult();
    },6000)
});
$resetBtn.addEventListener('click',()=>{
    $ball.classList.remove('spin');
    $spinBtn.classList.add('blocked');
    $resetBtn.classList.add('blocked');
    // $bettingBox.classList.replace('close','open');
    $display.parentNode.style.background = 'green';
    $display.textContent = '';
    $showResult.firstElementChild.classList.add('hide');
    $showResult.lastElementChild.textContent = '';
    $betCash.classList.remove('blocked');
    $betNumber.classList.remove('blocked');
    $betColor.classList.remove('blocked');
    $bettingBtn.classList.remove('blocked');
});

function showrn(){
    console.log(rouletteInfo.number);
    $display.textContent = rouletteInfo.number;
    $display.parentNode.style.background = rouletteInfo.color;
}
const $ruleBtn = document.querySelector('.rule.btn');
$ruleBtn.addEventListener('click',()=>{
    console.log($ruleBtn.lastElementChild);
    $ruleBtn.lastElementChild.classList.toggle('hide');
});

function showResult(){
    // console.log(bettingInfo.rate);
    if(bettingInfo.rate==1){
        // console.log(rouletteInfo.color);
        // console.log(bettingInfo.inputNumber);
        if(rouletteInfo.color===bettingInfo.inputNumber){
            $showResult.firstElementChild.classList.remove('hide');
            total += bettingInfo.rate*bettingInfo.money+bettingInfo.money;
            $showResult.lastElementChild.textContent = `축하합니다.`;
        }else{
            $showResult.lastElementChild.textContent = `꽝`
            total -= bettingInfo.money;
        }
    }else if(bettingInfo.rate==35){
        if(rouletteInfo.number==bettingInfo.number){
            $showResult.firstElementChild.classList.remove('hide');
            $showResult.lastElementChild.textContent = `축하합니다.`
            total += bettingInfo.rate*bettingInfo.money+bettingInfo.money;
        }else{
            $showResult.lastElementChild.textContent = `꽝`
            total -= bettingInfo.money;
            // alert('꽝');
        }
    }
    $resetBtn.classList.remove('blocked');
    $textinput2.value = total + ' 원';
}

function whatNumber(n){ //9.72
    console.log(n);
    if(n<=4.86 || n>354.77){
        rouletteInfo.number=0;
        rouletteInfo.color='green';
    } 
    else if(4.85<n && n <=14.57) {
        rouletteInfo.number=32;
        rouletteInfo.color='red';
    }
    else if(14.57<n&& n <=24.29) {
        rouletteInfo.number=15;
        rouletteInfo.color='black';
    }
    else if(24.29<n&& n <=34.01) {
        rouletteInfo.number=19;
        rouletteInfo.color='red';
    }
    else if(34.01<n&& n <=43.73) {
        rouletteInfo.number=4;
        rouletteInfo.color='black';
    }
    else if(43.73<n&& n <=53.45) {
        rouletteInfo.number=21;
        rouletteInfo.color='red';
    }
    else if(53.45<n&& n <=63.17) {
        rouletteInfo.number=2;
        rouletteInfo.color='black';
    }
    else if(63.17<n&& n <=72.89) {
        rouletteInfo.number=25;
        rouletteInfo.color='red';
    }
    else if(72.89<n&& n <=82.61) {
        rouletteInfo.number=17;
        rouletteInfo.color='black';
    }
    else if(82.61<n&& n <=92.33) {
        rouletteInfo.number=34;
        rouletteInfo.color='red';    
    }
    else if(92.33<n&& n <=102.05) {
        rouletteInfo.number=6;
        rouletteInfo.color='black';    
    }
    else if(102.05<n&& n <=111.77) {
        rouletteInfo.number=27;
        rouletteInfo.color='red';    
    }
    else if(111.77<n&& n <=121.49) {
        rouletteInfo.number=13;
        rouletteInfo.color='black';
    }
    else if(121.49<n&& n <=131.21) {
        rouletteInfo.number=36;
        rouletteInfo.color='red';
    }
    else if(131.21<n&& n <=140.93) {
        rouletteInfo.number=11;
        rouletteInfo.color='black';
    }
    else if(140.93<n&& n <=150.65) {
        rouletteInfo.number=30;
        rouletteInfo.color='red';
    }
    else if(150.65<n&& n <=160.37) {
        rouletteInfo.number=8;
        rouletteInfo.color='black';
    }
    else if(160.37<n&& n <=170.09) {
        rouletteInfo.number=23;
        rouletteInfo.color='red';
    }
    else if(170.09<n&& n <=179.81) {
        rouletteInfo.number=10;
        rouletteInfo.color='black';    
    }
    else if(179.81<n&& n <=189.53) {
        rouletteInfo.number=5;
        rouletteInfo.color='red';
    }
    else if(189.53<n&& n <=199.25) {
        rouletteInfo.number=24;
        rouletteInfo.color='black';
    }
    else if(199.25<n&& n <=208.97) {
        rouletteInfo.number=16;
        rouletteInfo.color='red';    
    }
    else if(208.97<n&& n <=218.69) {
        rouletteInfo.number=33;
        rouletteInfo.color='black';    
    }
    else if(218.69<n&& n <=228.41) {
        rouletteInfo.number=1;
        rouletteInfo.color='red';
    } 
    else if(228.41<n&& n <=238.13) {
        rouletteInfo.number=20;
        rouletteInfo.color='black';
}
    else if(238.13<n&& n <=247.85) {
        rouletteInfo.number=14;
        rouletteInfo.color='red';    
    }
    else if(247.85<n&& n <=257.57) {
        rouletteInfo.number=31;
        rouletteInfo.color='black';
    }
    else if(257.57<n&& n <=267.29) {
        rouletteInfo.number=9;
        rouletteInfo.color='red';
    }
    else if(267.29<n&& n <=277.01) {
        rouletteInfo.number=22;
        rouletteInfo.color='black';
    }
    else if(277.01<n&& n <=286.73) {
        rouletteInfo.number=18;
        rouletteInfo.color='red';
    }
    else if(286.73<n&& n <=296.45) {
        rouletteInfo.number=29;
        rouletteInfo.color='black';
    }
    else if(296.45<n&& n <=306.17) {
        rouletteInfo.number=7;
        rouletteInfo.color='red';
    }
    else if(306.17<n&& n <=315.89) {
        rouletteInfo.number=28;
        rouletteInfo.color='black';
    }
    else if(315.89<n&& n <=325.61) {
        rouletteInfo.number=12;
        rouletteInfo.color='red';    
    }
    else if(325.61<n&& n <=335.33) {
        rouletteInfo.number=35;
        rouletteInfo.color='black';
    }
    else if(335.33<n&& n <=345.05) {
        rouletteInfo.number=3;
        rouletteInfo.color='red';    
    }
    else if(345.05<n&& n <=354.77) {
        rouletteInfo.number=26;
        rouletteInfo.color='black';    
    }
}

const $betNumber = document.querySelector('.bet-number');
(function (){
    for(let i=0;i<=36;i++){
        $betNumber.insertAdjacentHTML('beforeend',`<input type="radio" id="bet-${i}" name="roulette-bet" data-rate="35" data-select="${i}"><label for="bet-${i}">${i}</label>`);
    }
})();

const $bettingBox = document.querySelector('.betting-box');
const $bettingBtn = document.querySelector('.btn-betting');
const $betColor = document.querySelector('.bet-color');
const $betCash = document.querySelector('.bet-cash');


$bettingBtn.addEventListener('click',(e)=>{
    if(!document.querySelector('input[name="roulette-bet"]:checked')){
        alert('베팅할 항목을 선택하세요');
    }else if(total < $bettingCash.value){
        alert('잔액이 부족합니다');
    }else{
        if(confirm('이대로 베팅하시겠습니까?')){
            // $bettingBox.classList.remove('open');
            // $bettingBox.classList.add('close');
            $spinBtn.classList.remove('blocked');
            bettingInfo.rate = document.querySelector('input[name="roulette-bet"]:checked').dataset.rate;
            bettingInfo.money = +$bettingCash.value;
            bettingInfo.inputNumber = document.querySelector('input[name="roulette-bet"]:checked').dataset.select;
            $betCash.classList.add('blocked');
            $betNumber.classList.add('blocked');
            $betColor.classList.add('blocked');
            $bettingBtn.classList.add('blocked');
        }
    }
});

const $bettingCash = document.querySelector('#betting-cash');
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

const bettingInfo = {
    rate : 0,
    inputNumber : 0,
    money : 0
}
const rouletteInfo = {
    number : 0,
    color : null
}



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


const $no = document.querySelectorAll('.nothat');
console.log($no);

for(let $nothat of $no){
    $nothat.addEventListener('click', function(){
      alert('죄송합니다. 점검 중 입니다.');
    })
};