# frozen_string_literal: true

# ## Schema Information
#
# Table name: `exchange_rate_records`
#
# ### Columns
#
# Name                             | Type               | Attributes
# -------------------------------- | ------------------ | ---------------------------
# **`id`**                         | `bigint`           | `not null, primary key`
# **`base_currency(基準通貨)`**    | `string`           | `default("usd"), not null`
# **`rate`**                       | `decimal(10, 4)`   | `not null`
# **`recorded_at(記録日時)`**      | `datetime`         | `not null`
# **`target_currency(対象通貨)`**  | `string`           | `default("jpy"), not null`
# **`created_at`**                 | `datetime`         | `not null`
# **`updated_at`**                 | `datetime`         | `not null`
#
class ExchangeRateRecord < ApplicationRecord
  validates :base_currency, presence: true
  validates :target_currency, presence: true
  validates :rate, presence: true
  validates :recorded_at, presence: true

  enum :base_currency, { usd: "usd" }
end
