class CadastroPage < SitePrism::Page
set_url '?controller=authentication&back=my-account'
element :email_create_account_field, '#email_create'
element :create_account_btn, '#SubmitCreate'  
element :title_fem_rd, '#id_gender2'
element :first_name_field, '#customer_firstname'
element :last_name_field, '#customer_lastname'
element :password_field, '#passwd'
element :day_select, '#days'
element :month_select, '#uniform-months'
element :year_select, '#uniform-years'
element :newsletter_checkbox, '#uniform-newsletter'
element :adress_field, '#address1'
element :city_field, '#city'
element :state_select, '#uniform-id_state'
element :zip_code_field, '#postcode'
element :mobile_phone_field, '#phone_mobile'
element :adress_alias_field, '#alias'
element :register_btn, "#submitAccount"

#puts serve para imprimir algo para mim na tela
#temos variaveis de 3 tipos no ruby: 
#@ - variavel de instancia (ao terminar a execução do seu escopo ela deixa de existir)
#@@ - variavel de classe (cilo de vida daquela class)
#$ - global (perigoso, pois pode ser acessado de qlq lugar) 

def iniciar_criacao_conta(email)
   puts @email = email.eql?('aleatorio') ? Faker::Internet.email(domain: 'guts') : email
    email_create_account_field.set @email
    create_account_btn.click
end

def preencher_form_dados_fixos
    title_fem_rd.set true 
    @@first_name = 'Andre'
    first_name_field.set @@first_name
    @@last_name = "Paganelo"
    last_name_field.set @@last_name
    password_field.set '12345'
    day_select.select "11"
    month_select.select "May"
    year_select.select "1990"
    newsletter_checkbox.click
    adress_field.set "Avenue Copacaba, 245"
    city_field.set "Porto Alegre"
    state_select.select "Iowa"
    zip_code_field.set "56789"
    mobile_phone_field.set "5551988776655"
    adress_alias_field.set "Casa"
end

def preencher_form_dados_aleatorios
    title_fem_rd.set true 
    @@first_name = Faker::Name.first_name #gera first name, ja salva na variavel de classe, e usa no metodo "account_ful_name"
    first_name_field.set @@first_name
    @@last_name = Faker::Name.last_name  #gera last name, ja salva na variavel de classe, e usa no metodo "account_ful_name"
    last_name_field.set @@last_name
    password_field.set Faker::Internet.password(min_length: 5, max_length: 10, mix_case: true, special_characters: true)
    day_select.select "11"
    month_select.select "May"
    year_select.select "1990"
    newsletter_checkbox.click
    adress_field.set "Avenue Copacaba, 245"
    city_field.set "Porto Alegre"
    state_select.select "Iowa"
    zip_code_field.set "56789"
    mobile_phone_field.set "1198654542559"
    adress_alias_field.set "Casa"
end

def confirmar_cadastro
    register_btn.click
end 

def account_full_name
"#{@@first_name} #{@@last_name}"
end

end