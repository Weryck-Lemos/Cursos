package Desafio_5;

public abstract class ContaBancaria implements Conta{
    double saldo;
    TipoConta tipo;

    public ContaBancaria(TipoConta tipo){
        saldo = 0;
        this.tipo = tipo;
    }

    @Override
    public void consultarSaldo() {
        System.out.println("Seu da conta "+ tipo+ ": "+saldo);
    }
}
