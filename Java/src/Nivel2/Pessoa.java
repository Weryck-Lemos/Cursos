package Nivel2;

public class Pessoa {
    String nome;
    double altura;
    String cidade;

    public void BeberAgua(){
        System.out.println(nome + " bebe água!");
    }

    void Infos(){
        System.out.println("Nome: " + nome);
        System.out.println("Altura: " + altura);
        System.out.println("Cidade: " + cidade);
        System.out.println(" ");
    }
}
