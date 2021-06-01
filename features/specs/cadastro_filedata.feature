#language: pt



Funcionalidade: Cadastrar Cliente
Como um cliente da Loja Online
Quero cadastrar uma conta 
Para eftuar compras

@cadastro_filedata
Cenario: Cadastrar clientes com dados validos de arquivo externo
Dado que acesso a pagina de login/cadastro 
E solicito um novo cadastro para o email 'padrão'
E preencho os campos do formulario com dados validos padrão
Quando confirmo o cadastro 
Então devo ser direcionado à pagina de minha conta 