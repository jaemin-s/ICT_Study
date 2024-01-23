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