require "faraday"

module ExchangeRateRecords
  class ImportJob < ApplicationJob
    def perform
      response = faraday_client.post do |req|
        req.url "/v2/calc/fx"
        req.headers["accept"] = "application/json"
        req.headers["content-type"] = "application/json"
        req.body = { "ccy1": "USD", "ccy2": "JPY" }.to_json
      end

      ExchangeRateRecord.create!(recorded_at: Time.current, rate: response.body[0])
    end

    private

    def faraday_client
      Faraday.new "https://api-pub.bitfinex.com" do |faraday|
        faraday.request :url_encoded
        faraday.response :json, content_type: /\bjson$/
        faraday.response :raise_error
        faraday.adapter Faraday.default_adapter
      end
    end
  end
end
