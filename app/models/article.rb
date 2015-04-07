class Article < ActiveRecord::Base
    validates :title,
        presence: true,
        length: {
            maximum: 256,
            too_long: "Title must be no more than %{count} characters."
        }

    validates :body, presence: true
    validates :user, presence: true

    belongs_to :user
end