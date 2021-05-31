#language: pt



Funcionalidade: Cadastrar Cliente
Como um cliente da Loja Online
Quero cadastrar uma conta 
Para eftuar compras

@cadastro_dados_faker
Cenario: Cadastrar clientes com dados validos aleatorios
Dado que acesso a pagina de login/cadastro 
E solicito um novo cadastro para o email 'aleatorio'
E preencho os campos do formulario com dados validos aleatorios
Quando confirmo o cadastro 
Então devo ser direcionado à pagina de minha conta 