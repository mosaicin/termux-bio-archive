class Source < ApplicationRecord
  belongs_to :biography

  validates :title, :url, presence: true
  validates :url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
end
