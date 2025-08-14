package Nivel1.Condicoes;

import java.util.Scanner;

public class SwitchCases {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Escolha um número entre 1 e 3");

        int escolha = sc.nextInt();

        switch (escolha){
            case 1:
                System.out.println("Primeiro valor");
                break;

            case 2:
                System.out.println("Segundo valor");
                break;

            case 3:
                System.out.println("Terceiro valor");
                break;

            default:
                System.out.println("É ENTRE 1 E 3");
        }

        sc.close();
    }
}
