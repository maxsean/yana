class Api::V1::ChartsController < Api::V1::ApiController

  def index
    data = {
      "name": "surveys",
      "children": Survey.d3
    }

    render json: data
  end

end
