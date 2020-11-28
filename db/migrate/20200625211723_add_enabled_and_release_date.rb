# frozen_string_literal: true

class AddEnabledAndReleaseDate < ActiveRecord::Migration[5.2]
  def change
    add_column :actions, :enabled, :boolean
    add_column :actions, :release_date, :datetime

    add_column :campaigns, :enabled, :boolean
    add_column :campaigns, :start_date, :datetime
    add_column :campaigns, :end_date, :datetime

    add_column :articles, :enabled, :boolean
    add_column :articles, :release_date, :datetime
  end
end
