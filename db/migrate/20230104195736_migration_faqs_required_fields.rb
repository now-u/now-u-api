class MigrationFaqsRequiredFields < ActiveRecord::Migration[5.2]
  def change
    change_column_null :faqs, :question, false, ""
    change_column_null :faqs, :answer, false, ""
  end
end
