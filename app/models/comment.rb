class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :post

    validates :content, presence: {message: "Write something before submitting"}
end
