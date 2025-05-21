function carregar(){
    var msg = document.getElementById('msg')
    var img = document.getElementById('imagem')
    var data = new Date()
    var hora = data.getHours();
    
    msg.innerHTML = `Agora são ${hora} horas`;

    if(hora >=6 && hora<12){
        img.src = "manha.jpg";
        document.body.style.background= "rgb(112, 179, 255)";
    }

    else if(hora>=12 && hora<18){
        img.src = "tarde.jpeg";
        document.body.style.background= "rgb(255, 147, 85)";
    }

    else{
        img.src = "noite.jpg";
        document.body.style.background = "rgb(60, 60, 107)";
    }
}