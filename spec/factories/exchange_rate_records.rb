# frozen_string_literal: true

# == Schema Information
#
# Table name: exchange_rate_records
#
#  id                        :bigint           not null, primary key
#  base_currency(基準通貨)   :string           default("usd"), not null
#  rate                      :decimal(10, 4)   not null
#  recorded_at(記録日時)     :datetime         not null
#  target_currency(対象通貨) :string           default("jpy"), not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
FactoryBot.define do
  factory :exchange_rate_record do
  end
end
