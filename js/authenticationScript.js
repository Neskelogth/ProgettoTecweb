function verifylogin() {
    
    var username=  document.getElementById("usernameInputArea").value;
    var password = document.getElementById("passwordInputArea").value;

    var uhoh = true;
    if(username == ""){
        
        document.getElementById("erroreusername").classList.remove("nascosto");
        uhoh = false;    
    }
    if(password == ""){
        
        document.getElementById("errorepassword").classList.remove("nascosto");
        uhoh = false;
    }
    return uhoh;


}


function verifysignup(){

    
}