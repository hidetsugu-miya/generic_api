# frozen_string_literal: true

class ExchangeRateRecord < ApplicationRecord
  validates :base_currency, presence: true
  validates :target_currency, presence: true
  validates :rate, presence: true
  validates :recorded_at, presence: true

  enum :base_currency, { usd: "usd" }
end
