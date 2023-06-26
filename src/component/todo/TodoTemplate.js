import React, { useEffect, useState } from 'react'
import TodoHeader from './TodoHeader';
import TodoMain from './TodoMain';
import TodoInput from './TodoInput';
import { useNavigate } from 'react-router-dom';
import { Spinner } from 'reactstrap';

import './scss/TodoTemplate.scss'

import { API_BASE_URL as BASE, TODO } from '../../config/host-config';
import { getLoginUserInfo } from '../util/login-utils';
const TodoTemplate = () => {

  const [loading, setLoading] = useState(true);

  const redirection = useNavigate();

  const { token } = getLoginUserInfo();

  const requestHeader = {
    'content-type' : 'application/json',
    'Authorization' : 'Bearer '+ token
  }
  
  const API_BASE_URL = BASE+TODO;
  // 서버에 할일 목록(json)을 요청(fetch)해서 받아와야 함

  const [todos,setTodos] = useState([]);

  // todoInput에게 todoText를 받아오는 함수
  // 자식 컴포넌트가 부모 컴포넌트에게 데이터를 전달할 때는
  // props 사용이 불가능
  // 부모 컴포넌트에서 함수를 선언(매개변수 꼭 선언!) -> props로 함수를 전달
  const addTodo = todoText => {
    const newTodo = {
      title : todoText,
    }

    //리액트의 상태변수는 무조건 setter를 통해서만
    //상태값을 변경해야 렌더링에 적용된다.
    //다만, 상태변수가 불변성(immutable)을 가지기 때문에
    //기존 상태에서 변경은 불가능하고,
    //새로운 상태를 만들어서 변경해야 합니다.

    // const copyTodos = todos.slice();
    // copyTodos.push(newTodo);

    //setTodos(todos.concat(newTodo));

    //setTodos([...todos, newTodo]);
    fetch(API_BASE_URL,{
      method : 'POST',
      headers : requestHeader,
      body : JSON.stringify(newTodo)
    }).then(res => res.json()).then(data => setTodos(data.todos));
  }

  const rmTodo = id => {
    const param = '/'+id;
    fetch(API_BASE_URL+param,{
      method : 'DELETE',
      headers : requestHeader
    }).then(res => res.json()).then(data => setTodos(data.todos));
  }

  const chkTodo = (id,done) => {
    fetch(API_BASE_URL,{
      method : 'PATCH',
      headers : requestHeader,
      body : JSON.stringify({
        'id' : id,
        'done' : !done
      })
    }).then(res => res.json()).then(data => setTodos(data.todos));
  }

  const cntRestTodo = () =>{
    return todos.filter(todo => !todo.done).length;
  }

  useEffect(() => {
    fetch(API_BASE_URL,{
      method : 'GET',
      headers : requestHeader
    }).then(res => {
      if(res.status === 200) return res.json();
      else if(res.status === 403) {
        alert('로그인이 필요한 서비스 입니다.');
        redirection('login');
        return;
      } else {
        alert('관리자에게 문의하세요');
      }
      return;
      }
    ).then(data => {
      setTodos(data.todos);
      setLoading(false);
    });
  }, []);

  // 로딩이 끝난 후 보여줄 컴포넌트
  const loadEndedPage = (
    <div className='TodoTemplate'>
      <TodoHeader count={cntRestTodo} />
        <TodoMain 
          todoList={todos} 
          remove={rmTodo} 
          check={chkTodo} 
        />
      <TodoInput addTodo={addTodo} />
    </div>
  );

  // 로딩 중일 때 보여줄 컴포넌트
  const loadingPage = (
    <div className='loading'>
      <Spinner color='danger'>
        loading...
      </Spinner>
    </div>
  );

  return (
    <>
      { loading ? loadingPage : loadEndedPage }
    </>
  );
}

export default TodoTemplate;