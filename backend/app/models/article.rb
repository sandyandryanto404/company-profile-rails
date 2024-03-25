class Article < ApplicationRecord
    belongs_to :user
    has_many :article_comments
    has_many :article_references
    has_many :reference, through: :article_references
end
