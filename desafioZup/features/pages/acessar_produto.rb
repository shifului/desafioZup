class AcessarProduto
  include Capybara::DSL

  def acessar_produto
    all(EL['product_grid'], wait: 30)[0].click
  end
end
