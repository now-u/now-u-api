class AddVideoOfTheDayToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :video_of_the_day, :boolean, default: false
  end
end
