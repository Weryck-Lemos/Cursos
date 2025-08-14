package Nivel2;

public class Main {
    public static void main(String[] args) {
        Adulto p1 = new Adulto("Weryck", 1.82, "Quixadá");
        p1.beber();
        p1.Infos();

        Crianca p2 = new Crianca("crinca", 1.20, "Fortaleza");
        System.out.println(p2.pintar());
        p2.Infos();

        Idoso p3 = new Idoso("Velho", 1.75, "Crato");
        p3.Infos();
    }
}
