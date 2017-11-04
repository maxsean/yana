class Api::V1::IllnessesController < Api::V1::ApiController
  def index
    illnesses = Illness.all
    render json: illnesses
  end

  def show
    illness = Illness.find(params["id"])

    render json: illness
  end
end
