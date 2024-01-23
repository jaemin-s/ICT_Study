const MAX = 100;
const gameData = {
    secret_num: Math.floor(Math.random() * MAX) + 1,
    count: 0,
    countdown: 6,
    min: 1,
    max: MAX
};

//사용자의 입력을 수행하는 함수
function inputNumber() {

    //객체에서 min과 max의 값을 뽑아서 메세지를 완성.
    //객체 디스트럭쳐링으로 뽑아 보세요~
    let {
        min,
        max,
        count
    } = gameData;
    //사용자의 입력값을 객체에 추가
    let input = +prompt(`${min} ~ ${max} 사이 숫자를 입력하세요 [${count}/6]`);
    gameData.input = input;
    console.log(gameData);
    //입력값 검증 함수를 호출.    
    return checkNumber();

}

function checkNumber() {
    let {
        input,
        min,
        max,
        secret_num,
        countdown
    } = gameData;
    if (input >= min && input <= max) {

    } else {
        alert(`정확한 입력을 해주세요`);
        return;
    }
    gameData.count++;
    if (input === secret_num) {
        alert(`정답입니다.`);
        checkCountDown(countdown);
        return true;
    } else if (input < secret_num) {
        alert(`UP!`);
        gameData.min = input + 1;
        alertCountDown();
    } else {
        alert(`DOWN!`);
        gameData.max = input - 1;
        alertCountDown();
    }
}

function checkCountDown(countdown) {
    if (countdown > 0) {
        alert(`Win!
        ${gameData.count}번만에 맞췄습니다`);

    } else {
        alert(`Lose~
        ${gameData.count}번만에 맞췄습니다`);
    }
}

function alertCountDown() {
    gameData.countdown--;
    if (gameData.countdown > 0) {
        alert(`기회 ${gameData.countdown}번 남았습니다`);
    } else if (gameData.countdown === 0) {
        alert(`기회 소진~
        계속 도전해보세요`);
    }
}
(function () {
    alert('[UP & DOWN 게임 - 1 ~ 100 사이의 숫자를 맞춰보세요!]');


    while (!inputNumber()) {
        //true가 리턴되면 프로그램 종료.
        //false가 리턴되면 게임 계속 진행.
    }

}());