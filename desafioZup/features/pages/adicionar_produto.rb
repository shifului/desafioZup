class AdicionarProduto
  include Capybara::DSL

  def adicionar_produto
    find(EL['buy_btn'], wait: 30).click
  end
end
