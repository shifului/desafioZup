class AdicionarProduto
  include Capybara::DSL

  def adicionar_produto
    find("#btn-buy", wait: 60).click
  end
end
