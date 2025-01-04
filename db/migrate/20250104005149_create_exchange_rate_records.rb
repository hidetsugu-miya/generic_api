class CreateExchangeRateRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :exchange_rate_records do |t|
      t.string :base_currency, null: false, default: "usd", comment: "基準通貨"
      t.string :target_currency, null: false, default: "jpy", comment: "対象通貨"
      t.decimal :rate, null: false, precision: 10, scale: 4
      t.datetime :recorded_at, null: false, comment: "記録日時"
      t.timestamps
    end
  end
end
