/* 
    참고 사이트 https://www.7luck.com/JSPVIEW/default?URL_JSP=--guid--GUID_04_01_01&sel_lang_typ=KR

    rule : 
    - 카드(A~K)X(◆♠❤♣) = 52개, 덱이 무한하다고 가정(확률 계속 같음)
    - A = 1or11
    - J,Q,K = 10
    
    - 용어
    
    - Blackjack(블랙잭) : 첫 두 장의 카드 합이 21일 경우 >> 베팅 금액의 1.5를 받음
    - Bust(버스트) : 카드 합이 21을 초과 >> 패배
    - Push(푸쉬) : 플레이어와 딜러의 카드 합이 같을 경우 >> 비김
    - Stand,Stay(스탠드,스테이) : 카드를 더 뽑지 않고 차례를 마치는 것
    
    - Hit(힛) : 처음 2장 이후 카드를 더 뽑는 것
    - Split(스플릿) : 처음 받은 카드가 동일한 2장이면 나누어서 2번 진행하는 것. >> 스플릿 기능 없음
    - Double Down(더블 다운) : 첫 두장 이후 단 한장만 더 받는 대신 초기 베팅을 두배로 늘림
    - Surrender(서렌더) : 첫 두장 이후 베팅금액의 절반을 받고 게임을 포기

    - 순서

    - 시작전에 베팅금액 정함.
    - 블랙잭이면 베팅금액의 
    - 승리 시 베팅금액만큼 받고 패배 시 잃음
    - 무승부 시에는 원금만 돌려받음

    - 시작하면 딜러와 플레이어 각각 2장씩 받음
    - 합이 21이 되면 블랙잭 >> 1.5배받고 더 진행 안함
    - 21미만의 경우 21을 초과전까지 계속 받을 수 있음
    - 21초과시에는 버스트 >> 즉시 패배(딜러 카드 안받음)
    - 더 받지 않고 싶으면 멈출 수 있음
    - 플레이어가 살아있으면 딜러는 카드 합이 17이 될때까지 추가 카드를 뽑음

    */

const userInfo = {
    name : null,
    money : 0
};

let deck = [];

for(let i=0;i<52;i++){
    let simbol;
    let number;
    if(i<13){
        number = CardNum(i);
        simbol = 'D'+number;
    }else if(i<26){
        number = CardNum(i);
        simbol = 'C'+number;
    }else if(i<39){
        number = CardNum(i);
        simbol = 'H'+number;
    }else{
        number = CardNum(i);
        simbol = 'S'+number;
    }
    if(i%13 === 0){
        deck[i] = [11,simbol];
    }else if(i%13>9){
        deck[i] = [10,simbol];
    }else{
        deck[i] = [i%13+1,simbol];
    }
}


function CardNum(i){
    if(i%13 === 0){
        return 'A';
    }else if(i%13 === 10){
        return 'J';
    }else if(i%13 === 11){
        return 'Q';
    }else if(i%13 === 12){
        return 'K';
    }else{
        return i%13+1;
    }
}

const player = {
    firstCard : null,
    secondCard : null,
    name : 'Player',
    sum : 0
}
const dealer = {
    firstCard : null,
    secondCard : null,
    name : 'Dealer',
    sum : 0
}

function rdCard(){
    return Math.floor(Math.random()*52);
}

function isBlackJack(object1,object2){
    let result1 = (object1.firstCard[0]+object1.secondCard[0] === 21);
    let result2 = (object2.firstCard[0]+object2.secondCard[0] === 21);

    if(result1 && result2){
        console.log('Push(무승부');
    }else if(result1){
        console.log(`${object1.name} is BlackJack!`);
    }else if(result2){
        console.log(`${object2.name} is BlackJack!`);
    }else{
        console.log('블랙잭 없음 확인용 출력');
    }

    return result1||result2;
}

function blackJack(){
    player.firstCard = deck[rdCard()];
    player.secondCard = deck[rdCard()];
    player.sum = player.firstCard + player.secondCard;
    dealer.firstCard = deck[rdCard()];
    dealer.secondCard = deck[rdCard()];
    dealer.sum = dealer.firstCard + dealer.secondCard;

    console.log(player.firstCard);
    console.log(player.secondCard);
    console.log(dealer.firstCard);
    console.log(dealer.secondCard);

    if(isBlackJack(player,dealer)){
        return;
    }

    if(confirm('Hit?')){
        
    }

    
}



console.log(deck);

blackJack();
