*** Settings ***
Library            SeleniumLibrary


*** Variables ***
${BROWSER}    chrome
${URL}        http://automationpractice.com/

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
    


