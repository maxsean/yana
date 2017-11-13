class Api::V1::IllnessesController < Api::V1::ApiController
  def index
    # returns all illnesses in database
    illnesses = Illness.all.order('name')
    render json: illnesses
  end

  def show
    # returns a specific illness
    illness = Illness.find(params["id"])

    render json: illness
  end
end
