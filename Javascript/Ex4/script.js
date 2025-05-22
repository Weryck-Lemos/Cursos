function tabuada(){
    let num = Number(document.getElementById("txtn").value);
    let tab = document.getElementById("seltab");

    if(num == 0){
        window.alert("Por favor, digite um número")
        return;
    }

    tab.innerHTML ='';
    let c=1;
    while(c<=10){
        let item = document.createElement("option")
        item.text = `${num} x ${c} = ${num*c}`
        item.value= `tab${c}`
        tab.appendChild(item)
        c++
    }
    
}