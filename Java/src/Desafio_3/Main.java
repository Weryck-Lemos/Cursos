package Desafio_3;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Uchiha ninja = new Uchiha();

        while (true){
            System.out.println("=======================");
            System.out.println("  1 - Adicionar Uchiha ");
            System.out.println("  2 - Mostar Dados     ");
            System.out.println("  3 - Sair do Programa ");
            System.out.println("=======================");
            String op = sc.nextLine();


            switch (op){

                case "1":
                    System.out.print("Digite o nome: ");
                    ninja.nome = sc.nextLine();

                    System.out.print("Digite a idade: ");
                    ninja.idade = sc.nextInt();
                    sc.nextLine();

                    System.out.print("Digite a missão: ");
                    ninja.StatusMissao = sc.nextLine();

                    System.out.print("Digite a habilidade: ");
                    ninja.HabilidadeEspecial = sc.nextLine();
                    continue;

                case "2":
                    ninja.MostarInformacoes();
                    continue;

                case "3":
                    sc.close();
                    return;

                default:
                    System.out.println("Digite uma opção válida");
            }
        }
    }
}
