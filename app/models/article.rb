class Article < ApplicationRecord
    # Validations
    validates :title, 
        presence: true, 
        length: { in: 10..50 }, 
        uniqueness: { 
            scope: :author, 
            message: "Title already taken, please choose another." 
        }
    validates :body, presence: true
    validates :author,
        presence: true,
        format: {
            without: /\A[0-9]*\z/,
            message: "Author can not have only numbers."
        }
end
