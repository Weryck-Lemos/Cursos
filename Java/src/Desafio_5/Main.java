package Desafio_5;

public class Main {
    public static void main(String[] args) {
        ContaCorrente b1 = new ContaCorrente();
        ContaPoupanca b2 = new ContaPoupanca();

        b1.consultarSaldo();
        b2.consultarSaldo();

        b1.depositar(100);
        b2.depositar(100);

        b1.consultarSaldo();
        b2.consultarSaldo();
    }
}
