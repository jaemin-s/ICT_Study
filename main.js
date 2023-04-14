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

// 용석 부분
const $todoinput = document.querySelector('input.todo-input');
console.log($todoinput);

const $add = document.querySelector('.add');
// console.log($add);

const $todolist = document.querySelector('.todo-list');
// console.log($todolist);

const $delete = document.querySelectorAll('.delete');
// console.log($delete);

// const $checkbox = document.querySelectorAll('input[type="checkbox"]');
// console.log($checkbox);


$add.addEventListener('click', function () {
    if ($todoinput.value === '') {
      alert('할 일을 입력 해주세요');
      return;
    } else {
      console.log($todoinput.value);
      const $li = document.createElement('li');
  
      $li.innerHTML = `<input type="checkbox"/>
      <p>${$todoinput.value}</p>
      <i class="lnr lnr-undo modi"></i>
      <i class="lnr lnr-cross-circle delete"></i>`;
      $todolist.appendChild($li);
      $todoinput.value = '';
    }
  });



function createTodo(){
    const $li = document.createElement('li');
    $li.textContent = $todoinput.value;

    const $delete = document.createElement('i');
    $delete.className('.lnr lnr-cross-circle delete');
    $li.appendChild($delete);



    document.querySelector('.todo-list').appendChild($li);
    $todoinput.value = '';
};



$add.addEventListener('click', createTodo);


// const $ul = document.querySelector('.todo-list');
$ul.addEventListener('click', e => {
    
    if(!e.target.matches('li > .delete')) {
        return;
    }
    e.target.parentNode.classList.add('animation');
    
    const func = setTimeout(() => {
    $ul.removeChild(e.target.parentNode);

  }, 1000);



    
});


