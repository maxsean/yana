class Api::V1::SubmissionsController < Api::V1::ApiController

  def create
    if current_user
      submissions = JSON.parse(request.body.read)["payload"]

      user = current_user

      submissions.each do |k, v|
        Submission.create(user: user, question_id: k.to_i, answer: v.to_i)
      end

      message = {submission: ["successful"]}
      render json: {messages: message}
    else
      message = {please: ["sign in"]}
      render json: {messages: message}
    end
  end

end
