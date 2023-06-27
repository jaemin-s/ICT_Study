import React from 'react'
import classNames from 'classnames'
import {MdDelete, MdDone} from 'react-icons/md';
import './scss/TodoItem.scss'

const TodoItem = ({item:{id,title,done}, remove, check}) => {
  //const {id,title,done} = item;

  return (
    <li className='todo-list-item' >
      <div className={classNames('check-circle',{active:done})} onClick={()=>check(id,done)}>
        {done&&<MdDone/>}
      </div>
      <span className={classNames('text',{finish:done})}>{title}</span>
      <div className='remove' onClick={()=>remove(id)}>
        <MdDelete/>
      </div>
    </li>
  )
}

export default TodoItem;