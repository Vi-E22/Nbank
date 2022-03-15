



def factory_pix():
    saldo = 1000
    pix = 100
    saldo_final = saldo - pix
    transacao = {
        'saldo': saldo,
        'pix': pix,
        'saldo_final': saldo_final,
        'banco': 'Neon',
        'chave_pix': 'Scooby-Doo'
    }
    return transacao


def factory_pix_nulo():
    saldo = 1000
    pix = 0
    transacao = {
        'saldo': saldo,
        'pix': pix,
        'banco': 'C6 Bank',
        'chave_pix': 'Barbie'
    }
    return transacao


def factory_pix_negativo():
    saldo = 1000
    pix = -1
    transacao = {
        'saldo': saldo,
        'pix': pix,
        'banco': 'Nubank',
        'chave_pix': 'Jade Piton'
    }
    return transacao