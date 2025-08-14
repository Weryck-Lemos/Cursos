package Nivel1.Condicoes;

public class IfElse {
    public static void main(String[] args) {
        String nome = "Naruto Uzumaki";
        int idade = 16;
        boolean hokage = false;
        int missoes = 14;

        if(missoes>=10 && idade>=15){
            System.out.println(nome + " está pronto para passar de nível");
        }
        else{
            System.out.println((nome + " não completou o número de missões"));
        }
    }
}
