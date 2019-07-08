class UsdaFoodApiService
  def foods_with_ingredient(ingredient)
    params = {q: ingredient}
    fetch_data(uri_path: "/search", params: params)
  end

  private

  def conn
    conn = Faraday.new(url: 'https://api.nal.usda.gov/ndb/') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def fetch_data(options)
    response = conn.get do |req|
      req.url options[:uri_path]
      options[:params].each do |key, value|
        req.params[key] = value
      end
    end
    JSON.parse(response.body)
  end
end
