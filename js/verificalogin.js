async function verificadati(){
        var a = true; 
        await fetch('/api/loginInputCleaner.php' , {method: 'POST',
        credentials: 'same-origin',
        body: JSON.stringify({username: document.getElementById("usernameInputArea").value,
                              password: document.getElementById("passwordInputArea").value})
        })
        .then(response => response.json())
        .then(json=> {
            
            const user = json.user
            const password = json.password

            let el = document.getElementById("lol")

            if(user == 'empty'){
                document.getElementById("erroreusername").classList.remove("nascosto");
                a = false;
            }
            else{
                document.getElementById("erroreusername").classList.add("nascosto");
            }
            if(password == 'empty'){
                document.getElementById("errorepassword").classList.remove("nascosto");
                a = false;
            }
            else{
                document.getElementById("errorepassword").classList.add("nascosto");
            }
        })
    console.log(a);
    document.getElementById('valueerror').value = a;
}

function verificaverifica(){
    return document.getElementById('valueerror').value == "true";
}
//setInterval(function(){console.log(document.getElementById("usernameInputArea").value
// + " " + document.getElementById("passwordInputArea").value)},250)