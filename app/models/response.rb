class Response < ApplicationRecord
  belongs_to :biography

  STATUSES = %w[pending published rejected].freeze

  validates :name, :body, presence: true
  validates :status, inclusion: { in: STATUSES }
end
