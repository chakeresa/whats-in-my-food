class FoodsController < ApplicationController
  def index
    render locals: {
      facade: FoodIndexFacade.new(params["q"])
    }
  end
end
