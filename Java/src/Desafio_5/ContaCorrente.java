package Desafio_5;

public class ContaCorrente extends ContaBancaria{
    public ContaCorrente(){
        super(TipoConta.CORRENTE);
    }

    @Override
    public void depositar(double valor) {
        saldo += valor;
    }
}
