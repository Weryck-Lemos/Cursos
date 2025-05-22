function verificar(){
    let inicio = Number(document.getElementById("ini").value);
    let fim = Number(document.getElementById("fim").value);
    let passo = Number(document.getElementById("passo").value);
    let res = document.getElementById("res")

    if(passo<=0){
        res.innerHTML = "Passo inválido!"
        return;
    }

    let resultado = "Contador: <br>";

    if(inicio>fim){
        for(let i=inicio; i>=fim; i-=passo){
        resultado += `${i} -> `;
    }
    }

    else{
        for(let i=inicio; i<=fim; i+=passo){
        resultado += `${i} -> `;
    }

    }

    resultado +="\u{1F3C1}";
    res.innerHTML = resultado;
}