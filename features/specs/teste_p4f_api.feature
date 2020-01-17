# language: pt
# encoding: utf-8

Funcionalidade: Teste P4F

Cenario: Criar um empregado

    Dado um novo empregado
    Quando faco uma solicitacao Post para o servico Create
    Entao o codigo de resposta HTTP deve ser igual a 200
    E o contrato deve ser valido "post_create_schema.json"
    
Cenario: Consultar um empregado
    Dado um empregado cadastrado
    Quando faco uma solicitacao Get para o servico Employee Id
    Entao o codigo de resposta HTTP deve ser igual a 200

Cenario: Consultar todos os empregado
    Quando faco uma solicitacao Get para o servico Employees
    Entao o codigo de resposta HTTP deve ser igual a 200
    E deve exibir os todos os empregados cadastrados

Cenario: Excluir um empregado
    Dado um empregado cadastrado
    Quando faco uma solicitacao DELETE para o servico Employee Id
    Entao o codigo de resposta HTTP deve ser igual a 200
