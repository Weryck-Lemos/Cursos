package Nivel1.Desafios;

import java.util.Scanner;

public class D02 {
    public static void main(String[] args) {
        int tot = 0;
        Scanner sc = new Scanner(System.in);
        int N = 4;
        String pessoas[] =new String[N];

        while (true) {
            System.out.println("1 - Cadastrar Pessoa");
            System.out.println("2 - Mostrar Lista");
            System.out.println("3 - Retirar Pessoa");
            System.out.println("4 - Encessar Programa");


            String op = sc.nextLine();

            switch (op) {
                case "1":
                    if(tot<N) {
                        String p = sc.nextLine();
                        pessoas[tot] = p;
                        tot += 1;
                    }
                    else System.out.println("A lista está cheia");
                    continue;

                case "2":
                    System.out.println("===== Pessoas Cadastradas ======");
                    for (int i = 0; i < tot; i++) {
                        System.out.println(pessoas[i]);
                    }
                    System.out.println("=================================");
                    continue;

                case "3":
                    pessoas[tot]= null;
                    tot-=1;
                    continue;

                case "4":
                    sc.close();
                    break;

                default:
                    System.out.println("Digite um valor válido");
            }
        }
    }
}
