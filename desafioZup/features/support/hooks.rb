Before do
  @busca = Busca.new
  @acessarProduto = AcessarProduto.new
  @adicionar_produto = AdicionarProduto.new
  @remover_produto = RemoverProduto.new

  page.driver.browser.manage.window.resize_to(1920, 1080)
  page.driver.browser.manage.window.maximize
end

After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/, "_").tr("/", "_")

  if scenario.passed?
    tirar_foto(scenario_name.downcase!, "passou")
  else
    tirar_foto(scenario_name.downcase!, "falhou")
  end
end
