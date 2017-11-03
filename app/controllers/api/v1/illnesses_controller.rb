class Api::V1::IllnessesController < Api::V1::ApiController
  def index
    illnesses = Illness.all
    render json: illnesses
  end

  def show
    illness = Illness.find(params["id"])

    forums = illness.forums

    render json: { illness: illness, forums: forums}
  end
end
