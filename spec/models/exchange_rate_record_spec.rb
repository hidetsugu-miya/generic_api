# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExchangeRateRecord do
  subject(:model) { build(:exchange_rate_record) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:base_currency) }
    it { is_expected.to validate_presence_of(:target_currency) }
    it { is_expected.to validate_presence_of(:rate) }
    it { is_expected.to validate_presence_of(:recorded_at) }
  end
end
