import React from 'react'

const ChangeEvent = () => {

    const changeValue = e =>{
        console.log(`value: ${e.target.value}`);
        e.target.nextElementSibling.textContent=e.target.value;
    }


  return (
    <>
        <input type='text' onChange={changeValue}/>
        <p></p>

        <select onChange={ changeValue}>
            <option value='pizza'>피자</option>
            <option value='chicken'>치킨</option>
            <option value='pasta'>파스타</option>
        </select>
        <p></p>
    </>
  );
}

export default ChangeEvent;