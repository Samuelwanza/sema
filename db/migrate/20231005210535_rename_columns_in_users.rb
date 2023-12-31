# frozen_string_literal: true

class RenameColumnsInUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :Name, :name
    rename_column :users, :Photo, :photo
    rename_column :users, :Bio, :bio
    rename_column :users, :postCounter, :post_counter
  end
end
