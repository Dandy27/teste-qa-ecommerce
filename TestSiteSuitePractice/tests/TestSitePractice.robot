*** Settings ***
Resource           ../resource/Resource.robot
Test Setup         Abrir navegador
# Test Teardown      Fechar navegador 

*** Test Cases ***
Caso de Teste 01 - Pesquisar produto existente
    Acessar a página home do site
    Digitar o nome de produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02 - Pesquisar produto inexistente
    Acessar a página home do site
    Digitar o nome de produto "produtoNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem de erro "No results were found for your search "produtoNãoExistente""
    
Caso de Teste 03 - Lista de produtos
    Acessar a página home do site
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    As sub categorias devem ser exibidas
    Clicar na sub categoria "Summer Dresses" 
    Uma página com os produtos da categoria selecionada deve ser exibida      


*** Keywords ***


