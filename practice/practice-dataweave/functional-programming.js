///////////////////////////////////////////////////////////////////

// //Imperative Code (series of step)

const x1 = 10 ;
const multiplyX1 = x1 * 2 ;
let saveInformation
if(multiplyX1 >= 20){
    saveInformation = true
} else{
    saveInformation = false
};
console.log(saveInformation);

// // Declarative Code (not having many step i.e. short way)
// const DeclarativeCode = (x1) => ((x1 >= 20) ? true:false);
// console.log(DeclarativeCode(20));

/////////////////////////////////////////////////////////////////////////////////////////

// // Impure function (Output is dependent on external factor)
// let x1 = 10 ;
// function multiplyX1(x2) {
//     console.log("The output is : " , x1 * x2);
// };
// multiplyX1(70);

// // pure  +  imPure (mixed)
// function multiplyX1(x1 , x2){
//     console.log("The output is : " , x1 * x2);
// };
// multiplyX1(10 , 20);

// // Pure Function (gives same output for same input)
// function multiplyX1(x1 , x2){
//     return `The output is : ${x1 * x2}`
//     };
//     console.log(multiplyX1(10 , 20));

/////////////////////////////////////////////////////////////////////////////////////////////

// // Mutable ( are afected to each other just like zombii😂)

// const student1 = {
//   studentName: "Bharat Chim",
//   stusentId: 1,
//   studentLocation: "Pune",
// };
// const student2 = student1;
// student2.studentLocation = "Mumbai";
// console.log("Output for student 1 is :- " , student1);
// console.log("Output for student 2 is :- " , student2);

// // IMutable ( vaccinated 😜)
//  const student1 = {
//    studentName: "Bharat Chim",
//   stusentId: 1,
//   studentLocation: "Pune",
//  };
// const student2 = {...student1};
//  student2.studentLocation = "Mumbai";
//  console.log("Output for student 1 is :- " , student1);
//  console.log("Output for student 2 is :- " , student2);