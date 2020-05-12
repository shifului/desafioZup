class AcessarProduto
  include Capybara::DSL

  def acessar_produto
    all("div[class='row product-grid no-gutters main-grid'] > div", wait: 60)[0].click
  end
end
