class UsdaFoodApiService
  def foods_with_ingredient(ingredient)
    params = {q: ingredient}
    fetch_data(uri_path: "/ndb/search", params: params)
  end

  private

  def conn
    @conn ||= Faraday.new(url: 'https://api.nal.usda.gov/') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def fetch_data(options)
    response = conn.get do |req|
      req.url options[:uri_path]
      req.params['api_key'] = ENV['APIDATAGOV_API_KEY']
      options[:params].each do |key, value|
        req.params[key] = value
      end
    end
    JSON.parse(response.body)
  end
end
