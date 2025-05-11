var nome = 'Gustavo';
var idade = 41;
var nota = 5.5;

console.log("O aluno " + nome + " de " + idade + " anos tirou "+ nota)
console.log(`O aluno ${nome.toUpperCase()} de ${idade} anos tirou ${nota}`); //usa crase

var n1 = 1543.5;
n1.toFixed(2)
console.log(n1.toLocaleString('pt-BR', {style:'currency', currency:'BRL'}));