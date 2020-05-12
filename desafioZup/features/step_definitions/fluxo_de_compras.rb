Dado("que Julia esteja no site da Americanas") do
  visit("https://www.americanas.com.br/")
end

Quando("ela fizer uma busca por um {string}") do |string|
  @busca.fazer_busca(string)
end

Então("o resultado dessa busca deve ser relacionado com o {string} buscado") do |string|
  @produto = find(".h1.page-title", wait: 30)
  expect(@produto.text).to eql(string)
end

Quando("ela fizer uma busca por um {string} inexistente") do |string|
  @busca.fazer_busca(string)
end

Então("o resultado deve informar que não foi encontrado nenhum {string}") do |string|
  @texto = "Ops! nenhum resultado encontrado para \"#{string}\"."
  assert_text(@texto)
end

Dado("acessar o primeiro produto da lista") do
  @acessarProduto.acessar_produto
end

Dado("adicionar o produto na cesta") do
  @produto = find("#product-name-default").text
  @produto.downcase!
  @adicionar_produto.adicionar_produto
end

Dado("ela deve ser direcionada para a sua cesta") do
  @cesta = find(".page-title.col-xs-7")
  expect(@cesta.text).to eql "minha cesta"
end

Então("o produto deve ser exibido na cesta") do
  produto_cesta = find(".link-default.clearfix", wait: 60).text
  expect(produto_cesta.downcase!).to eql(@produto)
  puts produto_cesta
end

Dado("ela fizer uma busca pelo {string}") do |string|
  @busca.fazer_busca(string)
end

Dado("adicionar o produto da primeira busca na cesta") do
  @produto_x = find("#product-name-default").text
  @produto_x.downcase!
  @adicionar_produto.adicionar_produto
end

Dado("adicionar o produto da segunda busca na cesta") do
  @produto_y = find("#product-name-default").text
  @produto_y.downcase!
  @adicionar_produto.adicionar_produto
end

Dado("o primeiro produto e o segundo produto devem ser exibidos na cesta") do
  produto_cesta_x = all(".link-default.clearfix", wait: 60)[1].text
  expect(produto_cesta_x.downcase!).to eql(@produto_x)
  puts produto_cesta_x

  produto_cesta_y = all(".link-default.clearfix", wait: 60)[0].text
  expect(produto_cesta_y.downcase!).to eql(@produto_y)
  puts produto_cesta_y
end

Quando("ela remover o primeiro produto") do
  @remover_produto.remover_produto
end

Então("o segundo produto deve permanecer no cesta") do
  produto = find(".link-default.clearfix", wait: 60).text
  expect(produto.downcase!).to eql(@produto_x)
  puts produto
end
