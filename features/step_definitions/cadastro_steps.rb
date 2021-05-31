Dado('que acesso a pagina de login\/cadastro') do
    @app.cadastropage.load
  end
  
  Dado('solicito um novo cadastro para o email {string}') do |email|
    @app.cadastropage.iniciar_criacao_conta email
  end
  
  Dado('preencho os campos do formulario com dados validos fixos') do
    @app.cadastropage.preencher_form_dados_fixos
  end
  
  Quando('confirmo o cadastro') do
    @app.cadastropage.confirmar_cadastro
  end
  
  Dado('preencho os campos do formulario com dados validos aleatorios') do
    @app.cadastropage.preencher_form_dados_aleatorios
  end

  Dado('preencho os campos do formulario com {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}') do |gender, first_name, last_name, password, day, month, year, newsletter, company, adress, city, zipcode, state, phone, adress_name|
    @app.cadastropage.preencher_form_com_dados_de_exemplos(gender, first_name, last_name, password, day, month, year, newsletter, adress, city, state, zipcode, phone, adress_name)
  end                                                                                                   

  Então('devo ser direcionado à pagina de minha conta') do
    expect(@app.minhacontapage.page_title.text).to eq('MY ACCOUNT')
    expect(@app.minhacontapage.account_name.text).to eq(@app.cadastropage.account_full_name)
  end