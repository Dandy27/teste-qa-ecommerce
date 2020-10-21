*** Settings ***
Resource           ../resource/Resource.robot
Test Setup         Abrir navegador
# Test Teardown      Fechar navegador 

*** Test Cases ***
# Caso de Teste 01 - Pesquisar produto existente
#     Acessar a página home do site
#     Digitar o nome de produto "Blouse" no campo de pesquisa
#     Clicar no botão pesquisar
#     Conferir se o produto "Blouse" foi listado no site

# Caso de Teste 02 - Pesquisar produto inexistente
#     Acessar a página home do site
#     Digitar o nome de produto "produtoNãoExistente" no campo de pesquisa
#     Clicar no botão pesquisar
#     Conferir mensagem de erro "No results were found for your search "produtoNãoExistente""
    
# Caso de Teste 03 - Lista de produtos
#     Acessar a página home do site
#     Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
#     As sub categorias devem ser exibidas
#     Clicar na sub categoria "Summer Dresses" 
#     Uma página com os produtos da categoria selecionada deve ser exibida      

Caso de Teste 04 - Adicionar produtos no carrinho 
    Acessar a página home do site
    Digitar o produto "t-shirt" no campo de pesquisa
    Clicar no botão pesquisar
    A página com os produtos da categoria selecionada deve ser exibida      
    Clicar no botão "Add to cart" do produto
    Uma tela de confirmação deve ser exibida
    Clicar no botão "Proceed to checkout"
    A tela do carrinho de compras deve ser exibido, junto com os dados do produto e valores

# Caso de Teste 05 - Remover produtos 
    Acessar a página home do site
    Clicar no ícone carrinho de compras no menu superior direito
    A tela do carrinho de compras deve ser exibido
    Clicar no botão de remoção de produto do carrinho
    O sistema deve exibir a mensagem "Your shopping cart is empty."
                                                                            


*** Keywords ***


