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



$startBtn.onclick = function () {


    $startBtn.classList.add('blocked');
    // 랜덤 숫자 생성
    const num1 = Math.floor(Math.random() * 6) + 1;
    const num2 = Math.floor(Math.random() * 6) + 1;

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
    setTimeout(() => $reStartBtn.classList.remove('blocked'), 4000);
    


}

$reStartBtn.addEventListener('click',()=>{
    $cup.classList.remove('action');
    $startBtn.classList.remove('blocked');
    $reStartBtn.classList.add('blocked');
});

$ruleBtn.addEventListener('click',()=>{
    console.log($ruleBtn.lastElementChild);
    $ruleBtn.lastElementChild.classList.toggle('hide');
});