# frozen_string_literal: true

class RenameColumnsInPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :Text, :text
  end
end
