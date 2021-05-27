class CadastroPage < SitePrism::Page
set_url '?controller=authentication&back=my-account'
element :email_create_account_field, 'seletor'

def iniciar_criacao_conta(email)
end


end