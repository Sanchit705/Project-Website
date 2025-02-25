console.log("Hello");
document.write("Hello world");



let p=5;
let q=6;
let r=p*q;
document.writeln("Multiplication of two numbers ",r);

let x=10;
let y="test";
let z=x+y;
document.writeln(z);


let a=document.getElementById("test");
console.log(a);

let b=document.getElementsByTagName("h1");
console.log(b);


let hour=1;
if(hour > 12){
    document.writeln("Good Afternoon");
}

else if(hour > 18){
    document.writeln("Good evening");
}

else{
    document.writeln("Good evening");
}

let d=new Date().getDay();
console.log(d);


switch(d){
    case 1:
        console.log("Monday");
        break;

    case 2:
        console.log("Tuesday");
        break;
    
    case 3:
        console.log("Wednesday");
        break;

    case 4:
        console.log("Thursday");
        break;

    case 5:
        console.log("Friday");
        break;


    case 6:
        console.log("Saturday");
        break;

    case 7:
        console.log("Sunday");
        break;

    default: 
        console.log("Not found");
        
}


let arr=["hi","bye"];
console.log(arr);

let obj={
    str:"Hello",
    age:21,
}
console.log(obj);n