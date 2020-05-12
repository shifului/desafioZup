class RemoverProduto
  include Capybara::DSL

  def remover_produto
    all(".basket-productRemoveAct.link-primary.--desktop")[0].click
  end
end
