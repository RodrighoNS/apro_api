# frozen_string_literal: true

class CreateDevelopers < ActiveRecord::Migration[6.1]
  def change
    create_table :developers do |t|
      t.string :name
      t.string :role

      t.timestamps
    end
  end
end
