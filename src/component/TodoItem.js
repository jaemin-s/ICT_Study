import React from 'react'
import classNames from 'classnames'
import {MdDelete, MdDone} from 'react-icons/md';
import './scss/TodoItem.scss'

const TodoItem = ({item:{id,title,done}, rmTodo, chkTodo}) => {
  //const {id,title,done} = item;

  return (
    <li className='todo-list-item' >
      <div className={classNames('check-circle',{active:done})} onClick={()=>chkTodo(id)}>
        {done&&<MdDone/>}
      </div>
      <span className={classNames('text',{finish:done})}>{title}</span>
      <div className='remove' onClick={()=>rmTodo(id)}>
        <MdDelete/>
      </div>
    </li>
  )
}

export default TodoItem;