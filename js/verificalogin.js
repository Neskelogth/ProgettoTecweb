async function verificadati(){
        var a;
        await fetch('/api/loginInputCleaner.php' , {method: 'POST',
        credentials: 'same-origin',
        body: JSON.stringify({username: document.getElementById("usernameInputArea").value,
                             password: document.getElementById("passwordInputArea").value})
        })
        .then(response => a = response.json())
            
            console.log("brufolo")
            const user = a.user
            const password = a.password
            const internalError = a.internalError

            let el = document.getElementById("lol")

            if(user == 'empty'){
                let p = document.createElement("p");
                p.innerHTML = "Username non valido";
                el.appendChild(p);
                return false;
            }
        console.log("sottopalla")
        console.log(a)
        //return true;
}