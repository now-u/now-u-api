class NullableCauseImageField < ActiveRecord::Migration[5.2]
  def change
    change_column_null :causes, :image, true
    change_column_null :press_coverage_articles, :image_url, true
  end
end
