const validateEmail=(email)=> {
    const regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email);
}
function addtoNo(a, b)
{
   return Number(a)+Number(b) ;
}
export 
{
    validateEmail,
    addtoNo
}