class User < ActiveRecord::Base
    has_many :posts
    has_many :comments

    validates :username, presence: {message: "You must enter an ID."}
    validates :username, uniqueness: {message: "There is already a duplicate ID."}
    validates :password, length: { minimum:6, too_short:"minimum length of password is six."}
end
