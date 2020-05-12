class Busca < SitePrism::Page
  include Capybara::DSL

  def fazer_busca(produto)
    find("#h_search-input").set(produto)
    find("#h_search-btn").click
  end
end
