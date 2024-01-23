import React, { useState } from 'react'
import { MdAdd } from 'react-icons/md';
import cn from 'classnames';

import './scss/TodoInput.scss'
const TodoInput = ({addTodo}) => {

  //입력창이 열리는 여부를 표현하는 상태값
  const [open, setOpen] = useState(false);

  //할 일 입력창에 입력한 내용을 표현하는 상태값
  const [todoText, setTodoText] = useState('');

  const onToggle = () => {
    setOpen(!open);
  }

  const todoChangeHandler = e => {
    setTodoText(e.target.value);
  }

  const submitHandler = e =>{
    e.preventDefault();
    addTodo(todoText);
    setTodoText('');
  }

  return (
    <>
      {
        open && (
          <div className='form-wrapper'>
            <form className="insert-form" onSubmit={submitHandler}>
              <input 
                type='text'
                placeholder='할 일을 입력 후, 엔터를 누르세요'
                onChange={todoChangeHandler}
                value={todoText}
              />
            </form>
          </div>
        )
      }
      {/* 
        classnames(기본클래스이름,{조건부클래스이름:논리값})
        classnames(기본클래스이름,{논리변수명}) 논리변수명과 조건부 클래스 이름이 같을 때
       */}
      <button className={cn('insert-btn',{open})} onClick={onToggle}>
        <MdAdd/>
      </button>
    </>
  )
}

export default TodoInput;