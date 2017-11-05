class PostVote < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :value, numericality: true, inclusion: { in: [-1, 0, 1]}
  validates :user_id, uniqueness: { scope: :post_id }

  def self.getKarma(parameters)
    karma = 0
    upvote = 0
    downvote = 0
    PostVote.where(parameters).each do |postvote|
      karma += postvote["value"]
      if postvote["value"] == 1
        upvote += 1
      elsif postvote["value"] == -1
        downvote += 1
      end
    end
    {karma: karma, upvote: upvote, downvote: downvote}
  end

end
