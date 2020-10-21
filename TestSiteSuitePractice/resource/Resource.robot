*** Settings ***
Library            SeleniumLibrary


*** Variables ***
${BROWSER}        chrome
${URL}            http://automationpractice.com/
${EMAIL}          dandy28@gmail.com
${PASSWORD}       798889498498
${FIRST_NAME}     Daniel Barbosa
${LAST_NAME}      Santos
${ADRESS_01}      Nelson de Sousa Barbara 
${CITY}           Campinas
${STATE}          hawaii
${ZIP_CODE}       00000
${PHONE}          8989889890
${COUNTRY}        united States



*** Keywords ***
Abrir navegador
    Open Browser    about:blank        ${BROWSER}

Fechar navegador
    Close Browser 

Acessar a página home do site
    Go To     ${URL}    
    Title Should Be                   My Store 

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text                        css:#search_query_top    ${PRODUTO}

Clicar no botão pesquisar
    Click Element                      css:#searchbox > button

# conferencias
Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible       css:#columns
    Page Should Contain Image           css:a.product_img_link > img
    Page Should Contain Link            css:.right-block > h5 > a
    
Conferir mensagem de erro "${MENSAGEMALERTA}"
    Wait Until Element Is Visible       css:#center_column > p  
    Element Text Should Be              css:#center_column > p       ${MENSAGEMALERTA}

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
    Mouse Over                          Xpath://*[@id="block_top_menu"]/ul/li[1]/a

As sub categorias devem ser exibidas
    Wait Until Element Is Visible       Xpath://*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

Clicar na sub categoria "${SUBCATEGORIA}" 
    Click Element                        Xpath://*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

Uma página com os produtos da categoria selecionada deve ser exibida 
    Title Should Be                      Summer Dresses - My Store         

Digitar o produto "${T_PRODUTO}" no campo de pesquisa
    Input Text               css:#search_query_top     ${T_PRODUTO}    

A página com os produtos da categoria selecionada deve ser exibida      
    Wait Until Element Is Visible       css:#columns    
    Page Should Contain Image           Xpath://*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img    
    Page Should Contain Link            Xpath://*[@id="center_column"]/ul/li/div/div[2]/h5/a

Clicar no botão "Add to cart" do produto
    Click Element       css:#center_column > ul > li > div > div.right-block > div.button-container > a.button.ajax_add_to_cart_button.btn.btn-default > span

Uma tela de confirmação deve ser exibida
    Wait Until Element Is Visible       css:#layer_cart > div.clearfix

Clicar no botão "Proceed to checkout"
    Click Element                      css:#layer_cart div.button-container > a

A tela do carrinho de compras deve ser exibido, junto com os dados do produto e valores
    Wait Until Element Is Visible       css:div.columns-container
    
Clicar no ícone carrinho de compras no menu superior direito
    Click Element           css:#header > div:nth-child(3) > div > div > div:nth-child(3) > div > a

A tela do carrinho de compras deve ser exibido
    Wait Until Element Is Visible       css:#page > div.columns-container
    
Clicar no botão de remoção de produto do carrinho
    Mouse Over          Xpath://*[@id="header"]/div[3]/div/div/div[3]/div/a/b
    Click Element       Xpath://*[@id="header"]/div[3]/div/div/div[3]/div/div/div/div/dl/dt/span/a

O sistema deve exibir a mensagem "${CART_MSN}"
    Element Text Should Not Be  css:#center_column > p      ${CART_MSN}

Clicar no botão superior direito “Sign in”
    Wait Until Element Is Visible       css:#header > div.nav
    Click Element                       class=login

A página para fazer login deve ser exibida
    Wait Until Element Is Visible       id=center_column

Inserir um e-mail "${EMAIL}" válido
    Input Text                        id=email_create   ${EMAIL}

Clicar no botão "Create na account"
    Click Element                css:#SubmitCreate

A página com os campos de cadastro deve ser exibida
    Wait Until Element Is Visible      css:#customer_firstname

Preencher os campos obrigatórios
        Input Text             css:#passwd                  ${PASSWORD}
        Input Text             css:#customer_firstname      ${FIRST_NAME}
        Input Text             css:#customer_lastname       ${LAST_NAME}
        Input Text             css:#address1                ${ADRESS_01}
        Input Text             css:#city                    ${CITY}
        Input Text             css:#postcode                ${ZIP_CODE}
        Input Text             css:#phone_mobile            ${PHONE}
        Press Keys             Xpath://*[@id="id_state"]    ${STATE}
        Press Keys             Xpath://*[@id="id_country"]  ${COUNTRY}
        
Clicar em "Register"para finalizar o cadastro
        Click Element          css:#submitAccount   

A página de gerenciamento da conta deve ser exibida
    Title Should Be         My account - My Store           







