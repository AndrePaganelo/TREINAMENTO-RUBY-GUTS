class CadastroPage < SitePrism::Page
    set_url '?controller=authentication&back=my-account'
    element :email_create_account_field, '#email_create'
    element :create_account_btn, '#SubmitCreate'  
    element :title_fem_rd, '#id_gender2'
    element :title_masc_rd, '#id_gender1'
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
        case email
        when 'aleatorio'
           @email = Faker::Internet.email(domain: 'guts')
        when 'padrao'
           @email = UserData.get('email')
        else
            @email = email
        end
        puts @email = email.eql?('aleatorio') ? Faker::Internet.email(domain: 'guts') : email #imprimo o email apenas para verificar
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

    def preencher_form_com_dados_de_exemplos(gender, first_name, last_name, password, day, month, year, newsletter, adress, city, state, zipcode, phone, adress_name) #parenteses pois passaremos parametros neste metodo
        gender.eql?('fem') ? title_fem_rd.set(true) : title_masc_rd.set(true)
        @@first_name = first_name
        first_name_field.set @@first_name
        @@last_name = last_name
        last_name_field.set @@last_name
        password_field.set password
        day_select.select day
        month_select.select month
        year_select.select year
        unless newsletter.eql?('no') #se essa condicao for verdadeira, ele não fará nada. Qdo for falso, ele executa   
            newsletter_checkbox.click
        end
            adress_field.set adress
        city_field.set city
        state_select.select state  
        zip_code_field.set zipcode
        mobile_phone_field.set phone
        adress_alias_field.set adress_name
    end

    def preencher_form_com_dados_datafile
        UserData.get('gender').eql?('fem') ? title_fem_rd.set(true) : title_masc_rd.set(true)
        @@first_name = UserData.get('first_name')
        first_name_field.set @@first_name
        @@last_name = UserData.get('last_name')
        last_name_field.set @@last_name
        password_field.set UserData.get('password')
        day_select.select UserData.get('day')
        month_select.select UserData.get('month')
        year_select.select UserData.get('year')
        unless UserData.get('newsletter').eql?('no')
            newsletter_checkbox.click
        end
        adress_field.set UserData.get('adress')
        city_field.set UserData.get('city')
        state_select.select UserData.get('state')  
        zip_code_field.set UserData.get('zipcode')
        mobile_phone_field.set UserData.get('phone')
        adress_alias_field.set UserData.get('adress_name')

    end



    def confirmar_cadastro
        register_btn.click
    end 

    def account_full_name
        "#{@@first_name} #{@@last_name}"
    end
end