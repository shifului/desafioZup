class RemoverProduto
  include Capybara::DSL

  def remover_produto
    all(EL['basket_del'])[0].click
  end
end
