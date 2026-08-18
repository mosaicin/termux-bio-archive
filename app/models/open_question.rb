class OpenQuestion < ApplicationRecord
  belongs_to :biography

  STATUSES = %w[open investigating resolved archived].freeze

  validates :prompt, presence: true
  validates :status, inclusion: { in: STATUSES }
end
