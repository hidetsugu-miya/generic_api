require 'rails_helper'

RSpec.describe ExchangeRateRecords::ImportJob do
  describe '#perform' do
    subject(:perform) { described_class.perform_now }

    before do
      stub_request(:post, "https://api-pub.bitfinex.com/v2/calc/fx").to_return(status: 200, body: [ 1.0 ], headers: {})
    end

    it 'creates a new exchange rate record' do
      expect { perform }.to change(ExchangeRateRecord, :count).from(0).to(1)
    end
  end
end
