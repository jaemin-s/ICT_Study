import React from 'react'

const FoodItem = ({foodName:fName, foodId:fId, price}) => {
   // console.log('props: ',props);
  return (
    <li id={fId}>{fName}({price}원)</li>
  )
}

export default FoodItem