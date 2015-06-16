class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string  "playername",      null: false
      t.string  "password_digest", null: false
      t.integer "stats"
      t.string  "country"
      t.string  "guild"
      t.string  "session_token", null: false
      t.boolean "verified", default: false
      t.timestamps null: false
    end
  end
end
