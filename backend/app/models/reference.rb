class Reference < ApplicationRecord
    belongs_to :portfolio
    has_many :article_references
    has_many :article, through: :article_references
end
