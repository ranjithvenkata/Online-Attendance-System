
function validate()
{
	var id=document.registration.id; 
var uemail=document.registration.emailid;
var phone=document.registration.mblno;
if(allnumeric(phone)&&validateEmail(uemail)&&count(phone))
{
return true;
}
else
return false;
}

function check(id)
{
var	str=id;
var re = /(12011M35[0-3]\d)/;
         if(str.value.match( re ))
        { return true;
}
else
{
	alert("Entered ID is invalid");
return false;
}
         }






function countid(id){
	var count = id.value.length;  
if (count!=10)  
{  
alert("Your ID is not valid,Please check!");  
id.focus();  
return false;  
}
else
return true;  
}  



function count(phone){
	var count = phone.value.length;  
if (count!=10)  
{  
alert("Your Mobile number is not valid,Please check!");  
phone.focus();  
return false;  
}
else
return true;  
}  


function allnumeric(phone)  
{
   
var numbers = /^[0-9]+$/;  
if(phone.value.match(numbers))  
{  
return true;  
}  
else  
{  
alert('Mobile no must have numeric characters only');  
phone.focus();  
return false;  
}  
} 

function validateEmail(uemail)  
{  
var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
if(uemail.value.match(mailformat))  
{  
return true;  
}  
else  
{  
alert("You have entered an invalid email address!");  
uemail.focus();  
return false;  
} 
}
