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

  Então('devo ser direcionado à pagina de minha conta') do
    expect(@app.minhacontapage.page_title.text).to eq('MY ACCOUNT')
    expect(@app.minhacontapage.account_name.text).to eq(@app.cadastropage.account_full_name)
  end