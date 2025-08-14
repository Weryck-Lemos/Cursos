package Nivel1.Array;

public class array {
    public static void main(String[] args) {
        //tamanhos fixos
         String pessoas[] = new String[3];
         pessoas[0] = "Naruto";
         pessoas[1] = "Sasuke";
         pessoas[2] = "Sakura";

        int idade[] = new int[3];
        idade[0] = 16;
        idade[1] = 15;
        idade[2] = 30;

         for (int i = 0; i < 3; i++) {
             System.out.print(pessoas[i]+ " ");
             System.out.println(idade[i]);
         }
    }
}
