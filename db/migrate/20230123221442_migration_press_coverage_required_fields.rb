class MigrationPressCoverageRequiredFields < ActiveRecord::Migration[5.2]
  def change
    change_column_null :press_coverage_articles, :title, false, ""
    change_column_null :press_coverage_articles, :image_url, false, ""
    change_column_null :press_coverage_articles, :link, false, ""
    change_column_null :press_coverage_articles, :media_name, false, ""
  end
end
