class Api::V1::ChartsController < Api::V1::ApiController

# returns all survey data. consider other filtered options. also this starts a triple nested loop which is inefficient. consider refactoring to better option. Survey.d3 is a class method...which also calls Quesition and Choice class methods
  def index
    data = {
      "name": "surveys",
      "children": Survey.d3
    }

    render json: data
  end

end
