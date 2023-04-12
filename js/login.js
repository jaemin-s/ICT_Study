const $id = document.getElementById('id');
const $birth = document.getElementById('birth');
const $loginBtn = document.querySelector('.login-btn');
const $login = document.querySelector('.login');
const $nameAfter = document.querySelector('.nameAfter');
const date = new Date();

$loginBtn.onclick = function() {

    console.log(isNaN(+$birth.value));

    if($id.value === '') {
        alert('이름을 입력하세요');
        $id.focus();
        return;
    } else if($birth.value === '') {
        alert('생일을 입력하세요');
        $birth.focus();
        return;
    } 
    else if(isNaN(+$birth.value)) {
        //alert(typeof $birth.value);
        alert('숫자로 입력하세요.');
        $birth.focus();
        return;
    }
    else if($birth.value.length !== 6) {
        alert('6자리 숫자로 입력하세요.');
        $birth.focus();
        return;
    } else if($birth.value.substr(0,2) < 23 && $birth.value.substr(0,2) > 4) {
        alert('19세 이하는 가입 불가합니다.');
        $birth.focus();
        return;
    } else if($birth.value.substr(2,2) > 12) {
        alert('생년월일을 다시 입력하시오.(월)');
        $birth.focus();
        return;
    } else if($birth.value.substr(2,2) < 13) {
        if($birth.value.substr(2,2) === '02') {
            if($birth.value.substr(4,2) > 29) {
                alert('생년월일을 다시 입력하시오.(2월)');
                $birth.focus();
                return;     
            }
        } else if($birth.value.substr(2,2)%2===0) {
            if($birth.value.substr(4,2) > 30) {
                alert('생년월일을 다시 입력하시오.(짝수달)');
                $birth.focus();
                return;
            }
        } else {
            if($birth.value.substr(4,2) > 31) {
                alert('생년월일을 다시 입력하시오.(홀수달)');
                $birth.focus();
                return;
            }
        }   
    }

    $nameAfter.textContent = $id.value + ' 님 안녕하세요.';
    $login.removeChild($id.parentNode);
    $login.removeChild($birth.parentNode);
    $login.removeChild($loginBtn);
    $nameAfter.classList.remove("hide");
}