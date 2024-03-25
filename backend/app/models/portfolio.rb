class Portfolio < ApplicationRecord
    belongs_to :customer
    has_many :portfolio_images
    has_many :references
end
