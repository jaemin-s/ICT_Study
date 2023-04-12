// 3. 할 일 수정 누르면 p에서 input으로 바꾸기

const $ul = document.querySelector('.todo-list');
const $input = document.createElement('input');
$ul.addEventListener('click', e => {

    console.log(e.target);
    if(e.target.classList.contains('modi')) {
        let temp = e.target.parentNode.children[1].textContent;
        e.target.parentNode.children[1].textContent = '';
        e.target.parentNode.children[1].appendChild($input);
        $input.value = temp;
        e.target.parentNode.children[3].style.display = 'none';
        e.target.parentNode.children[2].style.display = 'block';
    } else if(e.target.classList.contains('confirm')){
        e.target.parentNode.children[1].textContent = $input.value;
        e.target.parentNode.children[2].style.display = 'none';
        e.target.parentNode.children[3].style.display = 'block';
    }
}) 

// 4. 체크박스 누르면 decoration 주기 (li에 .checked toggle)
const $checkbox = document.querySelectorAll('input[type="checkbox"]');
const $li = document.querySelector('li');

for (let $ck of [...$checkbox]) {
    $ck.addEventListener('change', e => {
        e.target.parentNode.classList.toggle('checked');
    })
}