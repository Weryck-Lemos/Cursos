function verificar(){
    let data = new Date()
    let ano = data.getFullYear()
    let fano = document.getElementById("txtano")
    let res = document.getElementById("res")

    if(fano.value.length == 0 || Number(fano.value)>ano){
        window.alert("Verifique os dados navamente")
    } 
    else{
        let fsex = document.getElementsByName("radsex")
        let idade =  ano-Number(fano.value)

        if(fsex[0].checked){
            genero="Homem"

            if(idade <10){
                imagem.src ="imagens/babyM.jpg"
            }

            else if(idade <21){
                imagem.src = "imagens/youngM.jpg"
            }

            else if(idade <50){
                imagem.src = "imagens/adultM.jpg"
            }

            else{
                imagem.src = "imagens/oldM.jpg"
            }
        }
        else{
            genero="Mulher"
            if(idade <10){
                imagem.src ="imagens/babyF.jpg"
            }

            else if(idade <21){
                imagem.src = "imagens/youngF.jpg"
            }

            else if(idade <50){
                imagem.src = "imagens/adultF.jpg"
            }

            else{
                imagem.src = "imagens/oldF.jpg"
            }
        }

        res.innerHTML = `${genero} com ${idade}`
    }
}