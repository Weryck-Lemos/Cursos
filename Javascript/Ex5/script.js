let num = document.querySelector("input#fnun");
let lista = document.querySelector("select#flista");
let res = document.querySelector("div#res");
let valores = [];

function isNumero(n){
    if(Number(n)>=1 && Number(n)<=100){
        return true;
    }

    return false;
}

function inLista(n,l){
    if(l.indexOf(Number(n)) == -1){
        return true;
    }

    return false;
}

function adicionar(){
    if(!isNumero(num.value)){
        window.alert("Digite um número válido");
        return;
    }

    if(!inLista(num.value, valores)){
        window.alert("Número já digitado antes");
        return;
    }

    res.innerHTML = "";

    valores.push(Number(num.value));
    let item = document.createElement("option");
    item.text = `Valor ${num.value} adicionado.`
    lista.appendChild(item);


    num.value = '';
    num.focus();  
}

function finalizar(){
    if(valores.length == 0){
        window.alert("Adicione valores antes de finalizar!");
        return;
    }

    let tot = valores.length;

    res.innerHTML = "";
    res.innerHTML += `<p>Total de valores: ${tot}</p>`;

    valores.sort()
    res.innerHTML += `<p>Maior valor: ${valores[tot-1]}</p>`;
    res.innerHTML += `<p>Menor valor: ${valores[0]}</p>`;

    let sum=0;
    for(let i=0; i<tot; i++){
        sum+= valores[i];
    }

    res.innerHTML += `<p>Soma total: ${sum}</p>`;
    res.innerHTML += `<p>Media: ${(sum/tot).toFixed(2)}</p>`;
}