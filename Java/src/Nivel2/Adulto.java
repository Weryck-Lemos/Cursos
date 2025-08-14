package Nivel2;

public class Adulto extends Pessoa{

    public Adulto(String nome, double altura, String cidade){
        this.nome = nome;
        this.altura = altura;
        this.cidade = cidade;
    }

    void beber(){
        System.out.println(nome + " pode beber");
    }
}
