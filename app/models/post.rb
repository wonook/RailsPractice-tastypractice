class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments

    validates :title, presence: {message: "It must have a title"}
    validates :category, inclusion: {in: ["Korean", "Japanese", "Chinese", "Western"], message: "Please select among the choices."}
    mount_uploader :image, ImageUploader
end
