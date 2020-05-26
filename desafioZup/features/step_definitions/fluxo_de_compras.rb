Dado("que Julia esteja no site da Americanas") do
  visit("https://www.americanas.com.br/")
end

Quando("ela fizer uma busca por {string}") do |string|
  @busca.fazer_busca(string)
end

Então("o resultado dessa busca deve ser relacionado com o {string} buscado") do |string|
  expect(page).to have_css(EL['product_grid'], wait: 10)
  @produto = find(EL['page_title'], wait: 30)
  expect(@produto.text).to eql(string)
end

Quando("ela fizer uma busca por um {string} inexistente") do |string|
  @busca.fazer_busca(string)
end

Então("o resultado deve informar que não foi encontrado nenhum {string}") do |string|
  expect(page).to have_css(EL['product_error'], wait: 10)
  @texto = "Ops! nenhum resultado encontrado para \"#{string}\"."
  assert_text(@texto)
end

Dado("acessar o primeiro produto da lista") do
  @acessarProduto.acessar_produto
end

Dado("adicionar o produto na cesta") do
  @produto = find(EL['product_name']).text
  @produto.downcase!
  @adicionar_produto.adicionar_produto
end

Então("o produto deve ser exibido na cesta") do
  produto_cesta = find(EL['product_list'], wait: 30).text
  expect(produto_cesta.downcase!).to eql(@produto)
  puts "Produto na cesta: #{produto_cesta}" 
end

Dado("ela fizer uma busca por {string} e adicionar na cesta") do |string|
  @busca.fazer_busca(string)
  @acessarProduto.acessar_produto
  @prod << find(EL['product_name']).text.downcase!
  @adicionar_produto.adicionar_produto
end

Dado("ela deve ser direcionada para a sua cesta") do
  @cesta = find(EL['basket'])
  expect(@cesta.text).to eql "minha cesta"
end

Dado("o primeiro produto e o segundo produto devem ser exibidos na cesta") do
  expect(page).to have_content('resumo do pedido')
  produto_cesta_x = all(EL['product_list'], wait: 30)[1].text
  expect(produto_cesta_x.downcase!).to eql(@prod[0])
  produto_cesta_y = all(EL['product_list'], wait: 30)[0].text
  expect(produto_cesta_y.downcase!).to eql(@prod[1])
end

Quando("ela remover o primeiro produto") do
  @remover_produto.remover_produto
end

Então("um produto deve permanecer na cesta") do
  produto = find(EL['product_list'], wait: 30).text
  expect(produto.downcase!).to eql(@prod[0])
  puts "Produto que restou na cesta:#{produto}"
end
