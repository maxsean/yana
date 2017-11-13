class Api::V1::SurveysController < Api::V1::ApiController
  def index
    # returns all surveys in database, ordered by title.
    surveys = Survey.all.order('title')
    render json: surveys
  end

  def show
    # returns a specific survey with associated questions and its associated choices
    survery = Survey.find(params["id"]).to_json(include: {questions: {include: :choices}})

    render json: survery
  end

end
