package Nivel1.Condicoes;
import java.util.Scanner;

public class Scanners {
    public static void main(String[] args) {
        Scanner caixa = new Scanner(System.in);

        System.out.print("Digite o nome: ");
        String nome = caixa.nextLine();

        System.out.print("Digite a idade: ");
        int idade = caixa.nextInt();


        if(idade>=18){
            System.out.println(nome + " pode sair em missões");
        }

        else{
            System.out.println(nome + " é muito novo ainda para sair em missões");
        }

        caixa.close();
    }
}
