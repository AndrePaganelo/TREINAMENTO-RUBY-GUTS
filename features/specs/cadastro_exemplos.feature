#language: pt
#uma terceira forma inves de usar dados fixo, inves de usar dados Faker, é usar tabelas de Exemplos

@regressivo
Funcionalidade: Cadastrar Cliente
Como um cliente da Loja Online
Quero cadastrar uma conta 
Para eftuar compras

@cadastro_exemplos
Esquema do Cenario: Cadastrar clientes com dados validos
Dado que acesso a pagina de login/cadastro  
E solicito um novo cadastro para o email <email>   
E preencho os campos do formulario com <gender>, <first_name>, <last_name>, <password>, <day>, <month>, <year>, <newsletter>, <adress>, <city>, <state>, <zipcode>, <phone>, <adress_name>
Quando confirmo o cadastro 
Então devo ser direcionado à pagina de minha conta  
Exemplos:
|  email                          | gender  | first_name | last_name   | password | day | month  | year  | newsletter |  adress       | city       | state | zipcode | | phone      | adress_name |                                                 
| 'paulanewblawwsblae111@guts.com' | 'fem'   | 'Paula'    | 'Silva'     | '1234567'| '10'| 'March'| '1980'| 'no'       | 'Rua Somalia' | 'Sao Paulo'| 'SP'  | '67543' | | 5551999999 | 'Casa'      |                                         
| 'paulanewe21blalnlan1l@guts.com' | 'fem'   | 'Paulinha  | 'Nunes'     | '1234567'| '20'| 'March'| '1985'| 'sim'      | 'Rua Austria' | 'Sao Paulo'| 'SP'  | '67553' | | 5551999999 | 'Casa'      |  


                                         



