package Nivel1.Condicoes;

import java.util.Scanner;

public class Ternarios {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Digite um valor: ");
        int n = sc.nextInt();

        String saida = (n%2==0) ? "par" : "ímpar";
        System.out.println("O número que você digitou é "+saida);
        sc.close();

    }
}
