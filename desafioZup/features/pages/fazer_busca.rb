class Busca
  include Capybara::DSL

  def fazer_busca(produto)
    find(EL['search_input']).set(produto)
    find(EL['search_btn']).click
  end
end
