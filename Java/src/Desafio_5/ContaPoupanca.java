package Desafio_5;

public class ContaPoupanca extends ContaBancaria{
    public ContaPoupanca(){
        super(TipoConta.POUPANCA);
    }

    @Override
    public void depositar(double valor) {
        saldo += valor*0.99;
    }
}
