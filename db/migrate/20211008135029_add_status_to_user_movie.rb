class AddStatusToUserMovie < ActiveRecord::Migration[6.0]
  def change
    add_column :user_movies, :status, :integer, default: 0
  end
end
