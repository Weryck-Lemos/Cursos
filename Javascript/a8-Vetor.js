let num = [4,2,8];
num.push(1);
num.sort();
for(let pos in num){
    console.log(`posicao: ${pos}  valor: ${num[pos]}`);
}


console.log(num.indexOf(8))
console.log(num.indexOf(7))