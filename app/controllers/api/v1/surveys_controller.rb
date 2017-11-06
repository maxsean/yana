class Api::V1::SurveysController < Api::V1::ApiController
  def index
    surveys = Survey.all
    render json: surveys
  end

  def show
    survery = Survey.find(params["id"]).to_json(include: {questions: {include: :choices}})

    render json: survery
  end
end
