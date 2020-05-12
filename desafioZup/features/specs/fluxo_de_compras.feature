#language: pt

Funcionalidade: Fluxo de compras
Validar a busca, adição e remoção de itens da cesta de compras

Contexto: 
Dado que Julia esteja no site da Americanas


Esquema do Cenario: Buscar produtos
Quando ela fizer uma busca por um <produto>
Então o resultado dessa busca deve ser relacionado com o <produto> buscado

Exemplos:
| produto         |
| "kitkat coelho" |
| "arroz camil"   |
| "espelho"       |


Esquema do Cenario: Buscar produto que não consta em estoque
Quando ela fizer uma busca por um <produto> inexistente
Então o resultado deve informar que não foi encontrado nenhum <produto> 

Exemplos:
|  produto                       |
| "xablau"                       |
| "inconstitucionalissimamente"  |
| "tem tuuudo, pode procurar :)" |


Esquema do Cenario: Adicionar um produto no cesta
E ela fizer uma busca por um <produto>
E acessar o primeiro produto da lista
E adicionar o produto na cesta
E ela deve ser direcionada para a sua cesta  
Então o produto deve ser exibido na cesta 

Exemplos:
| produto         |
| "kitkat coelho" |
| "arroz camil"   |
| "espelho"       |

@xablau
Esquema do Cenario: Remover um produto no cesta
E ela fizer uma busca pelo <produto1>
E acessar o primeiro produto da lista
E adicionar o produto da primeira busca na cesta
E ela fizer uma busca pelo <produto2>
E acessar o primeiro produto da lista
E adicionar o produto da segunda busca na cesta
E ela deve ser direcionada para a sua cesta 
E o primeiro produto e o segundo produto devem ser exibidos na cesta
Quando ela remover o primeiro produto
Então o segundo produto deve permanecer no cesta 

Exemplos:
| produto1         | produto2                      |
| "kitkat coelho"  | "chocolate kiner ovo meninas" |
| "arroz camil"    | "Bombom Rocher"               |
| "espelho"        | "ruby cucumber"               |
