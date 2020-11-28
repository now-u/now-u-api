# frozen_string_literal: true

class AddProfilepicturesAndDescriptionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_picture_url, :string
    add_column :users, :description, :text
  end
end
