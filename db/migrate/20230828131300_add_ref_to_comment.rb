class AddRefToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :upload, null: false, foreign_key: true
  end
end
