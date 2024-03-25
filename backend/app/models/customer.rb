class Customer < ApplicationRecord
    has_many :portfolios
    has_many :testimonials
end
