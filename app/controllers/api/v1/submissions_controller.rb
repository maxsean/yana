class Api::V1::SubmissionsController < Api::V1::ApiController

  def create
    # create a survey submission if new, otherwise it updates existing submission (user must be signed in)
    if current_user
      submissions = JSON.parse(request.body.read)["payload"]
      user = current_user

      submissions.each do |k, v|
        submission = Submission.new(user: user, question_id: k.to_i, answer: v.to_i)
        if submission.valid?
          submission.save
        else
          submission = Submission.find_by(user: user, question_id: k.to_i)
          submission.update(answer: v.to_i)
        end
      end

      message = {submission: ["successful"]}
      render json: {messages: message}
    else
      message = {please: ["sign in"]}
      render json: {messages: message}
    end
  end

end
