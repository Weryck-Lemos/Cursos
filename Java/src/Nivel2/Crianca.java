package Nivel2;

public class Crianca  extends Pessoa{

    public Crianca(String nome, double altura, String cidade){
        this.nome = nome;
        this.altura = altura;
        this.cidade = cidade;
    }

    String pintar(){
        return nome + " vai pintar BobbieGoods";
    }

    @Override
    public void BeberAgua(){
        System.out.println(nome + " bebe pouca água");
    }
}
