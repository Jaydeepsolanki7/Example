class ChangeInPost < ActiveRecord::Migration[7.0]
  def change
    remove_reference :posts, :user
  end
end
