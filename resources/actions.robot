*** Settings ***
Documentation                       Ações customizadas do nBank

*** Keywords ***
Go To Home nBank
    Go To                           ${BASE_URL}
    Wait For Elements State         css=.carousel-items         visible                 5

Check Balance Amount 
    [Arguments]                     ${saldo}

    ${saldo}=                       Convert To String              ${saldo}
    ${element}                      Get Element                    css=.navbar-end a.navbar-item

    Wait For Elements State         ${element}                      visible                 5
    Get Text                        ${element}                      contains                ${saldo}

Make A Pix
    [Arguments]                     ${transacao}

    Click                           text=Fazer PIX

    # Checkpoint para visualização do Modal 
    Wait For Elements State         css=.modal-card-body img        visible                 5

    # Preencher Modal
    Select Options By               css=span.select select          text       ${transacao}[banco]
    Fill Text                       id=chave-pix                    ${transacao}[chave_pix]
    Fill Text                       id=valor                        ${transacao}[pix]
    Click                           text=Enviar PIX

Transaction Is Added To The Extract
    [Arguments]                     ${transacao}

    ${date}                         Get Current Date                result_format=%d/%m/%Y
    ${pix}                          Convert To String               ${transacao}[pix]

    ${element}                      Set Variable                    xpath=//td[contains(text(), "Envio de PIX")]/..

    Wait For Elements State         ${element}                      visible         5
    Get Text                        ${element}                      contains        ${transacao}[banco]
    Get Text                        ${element}                      contains        ${date}
    Get Text                        ${element}                      contains        ${pix}

Alert Message Should Be
    [Arguments]                     ${mensagem_esperada}

    ${element}                      Set Variable                    css=div.media-content

    Wait For Elements State         ${element}                      visible         5
    Get Text                        ${element}                      equal           ${mensagem_esperada}
