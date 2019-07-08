class FoodsController < ApplicationController
  def index
    render locals: {
      facade: FoodIndexFacade.new
    }
  end
end
