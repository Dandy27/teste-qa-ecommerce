*** Settings ***
Resource           ../resource/Resource.robot
Test Setup         Abrir navegador
Test Teardown      Fechar navegador 

*** Test Cases ***
Cenário de Teste 01 - Pesquisar produto existente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado da busca    

Cenário de Teste 02 - Pesquisar produto inexistente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "produtoNãoExistente"
    Então a página deve exibir a mensagem "No results were found for your search "produtoNãoExistente""
      


*** Keywords ***   

Dado que estou na página home do site
    Acessar a página home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar
    
Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca    
    Conferir se o produto "${PRODUTO}" foi listado no site

Então a página deve exibir a mensagem "${MENSAGEMALERTA}"
    Conferir mensagem de erro "${MENSAGEMALERTA}"
