import React from 'react'

const ClickEvent = () => {

    const greeting = ()=>{
        alert('hello');
    }

    const changBox = e =>{
        const $box = document.querySelector('.box');
        $box.style.background = 'skyblue';
        $box.style.width = '200px';
        $box.style.height = '200px';
    }


  return (
    <>
        <button id='btn1' onClick={()=>{alert('클릭')}}>클릭</button>
        <button id='btn2' onClick={greeting}>클릭2</button>
        <button id='btn3' onMouseOver={changBox}>클릭3</button>

        <div className='box'></div>
    </>
  )
}


export default ClickEvent