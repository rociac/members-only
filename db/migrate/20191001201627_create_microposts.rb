# frozen_string_literal: true

class CreateMicroposts < ActiveRecord::Migration[5.2]
  def change
    create_table :microposts do |t|
      t.text :content
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
