function verifylogin() {

    return true;

    const username=  document.getElementById("usernameInputArea").value;
    const password = document.getElementById("passwordInputArea").value;

    const link = window.location.href;
    const parts = link.split("&");

    const possibleErrors = ['eusne', 'epane', 'eusnv', 'epanv', 'sqlit'];
    let actualErrors = [];

    parts.forEach((element) => {

        possibleErrors.forEach((error) => {

            if(element.includes(error)){

                actualErrors.push(error);
            }
        })
    })

    console.log(actualErrors);

    let ok = true;
    if(username == ""){

        if(actualErrors.indexOf('eusne') != -1 || actualErrors.indexOf('eusnv') != -1){

            const invalidUser = document.getElementById("invalidUser");
            const unknownUser = document.getElementById("unknownUser");

            if(unknownUser != null){

                unknownUser.remove();
                document.getElementById("erroreusername").classList.remove("nascosto");
            }

        }else{

            document.getElementById("erroreusername").classList.remove("nascosto");
        }

        if(actualErrors.indexOf('sqlit') && document.getElementById("sql") != null){

            document.getElementById("sql").remove();
        }

        ok = false;
    }
    if(password == ""){

        if(actualErrors.indexOf('eusne') != -1 || actualErrors.indexOf('eusnv') != -1){

            const invalidPass = document.getElementById("invalidPass");
            const wrongPass = document.getElementById("wrongPass");

            if(wrongPass != null){

                wrongPass.remove();
                document.getElementById("errorepassword").classList.remove("nascosto");
            }

        }else{

            document.getElementById("errorepassword").classList.remove("nascosto");
        }

        if(actualErrors.indexOf('sqlit') && document.getElementById("sql") != null){

            document.getElementById("sql").remove();
        }

        ok = false;
    }

    return ok;
}


function verifysignup(){

    
}