import React from 'react';

// meant for anything the backend throws back (i.e. errors and messages) in {key => [values]} format
const FormErrors = (props) => {
  let errors = props.formErrors;
  return(
    <div className='formErrors'>
      <ul>
       {Object.keys(errors).map((fieldName, i) => {
         if(errors[fieldName].length > 0){
           if(fieldName == "handle"){
             return (
               <li key={i}>username {errors[fieldName].join(', ')}</li>
             )
           } else {
             return (
               <li key={i}>{fieldName} {errors[fieldName].join(', ')}</li>
             )
           }
         } else {
           return '';
         }
       })}
      </ul>
   </div>
 );
};

export default FormErrors;
