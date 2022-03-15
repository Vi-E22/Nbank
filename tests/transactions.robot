*** Settings ***
Documentation                                   Suite de testes do nBank

Library                                         ${EXECDIR}/resources/factories/transaction_pix.py

Resource                                        ${EXECDIR}/resources/base.robot

Test Setup                                      Start Session
Test Teardown                                   End Session

*** Test Cases ***
Cenario 1: Saldo
    [Tags]  saldo
    Go To Home nBank
    Check Balance Amount                        1000

Cenario 2: Fazer PIX
    [Tags]  pix
    ${transacao}    Factory Pix

    Check Balance Amount                        ${transacao}[saldo]
    Make A Pix                                  ${transacao}
    Check Balance Amount                        ${transacao}[saldo_final]
    Transaction Is Added To The Extract         ${transacao}

Cenario 3: PIX com valor ZERO
    [Tags]  pix-zero
    ${transacao}    Factory Pix Nulo

    Check Balance Amount                        ${transacao}[saldo]
    Make A Pix                                  ${transacao}
    Alert Message Should Be                     Oops. Transferir ZERO é osso hein...

Cenario 4: PIX com valor NEGATIVO
    [Tags]  pix-negativo
    ${transacao}    Factory Pix Negativo

    Check Balance Amount                        ${transacao}[saldo]
    Make A Pix                                  ${transacao}
    Alert Message Should Be                     Oops. Valor para PIX incorreto...
