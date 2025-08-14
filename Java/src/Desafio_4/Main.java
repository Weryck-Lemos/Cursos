package Desafio_4;

public class Main {
    public static void main(String[] args) {
        Ninja ninja1 = new NinjaBasico("Kenshin", 25, "Golpe Rápido");
        Ninja ninja2 = new NinjaAvancado("Raiden", 30, "Chute Giratório", "Controle de Raios");

        ninja1.mostrarInformacoes();
        ninja1.executarHabilidade();

        System.out.println();

        ninja2.mostrarInformacoes();
        ninja2.executarHabilidade();
    }
}
