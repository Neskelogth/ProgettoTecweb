function verifylogin() {
    
    var username=  document.getElementById("usernameInputArea").value;
    var password = document.getElementById("passwordInputArea").value;

    var uhoh = true;
    if(username == ""){
        var a = window.location.href;
        var b = a.split("&").forEach((Element) => {
            if(Element == 'eusne=error'){
                window.location.replace('/?r=login');
                document.getElementById("erroreusername").classList.remove("nascosto");        
            }
        });
        console.log(b);
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