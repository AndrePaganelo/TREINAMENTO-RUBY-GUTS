#language: pt



Funcionalidade: Cadastrar Cliente
Como um cliente da Loja Online
Quero cadastrar uma conta 
Para eftuar compras

@cadastro_dados_fixos
Cenario: Cadastrar clientes com dados validos fixos
Dado que acesso a pagina de login/cadastro 
E solicito um novo cadastro para o email 'imersao_ruby_front@guts.com.br'
E preencho os campos do formulario com dados validos fixos 
Quando confirmo o cadastro 
Então devo ser direcionado à pagina de minha conta 