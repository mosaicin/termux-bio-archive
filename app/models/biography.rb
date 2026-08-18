class Biography < ApplicationRecord
  has_many :sources, dependent: :destroy
  has_many :responses, dependent: :destroy
  has_many :open_questions, dependent: :destroy

  STATUSES = %w[draft unverified reviewed published].freeze

  validates :title, :slug, :summary, :body, :author_name, presence: true
  validates :slug, uniqueness: true, format: { with: /\A[a-z0-9-]+\z/ }
  validates :status, inclusion: { in: STATUSES }

  scope :publicly_visible, -> { where(status: %w[reviewed published]) }
end
