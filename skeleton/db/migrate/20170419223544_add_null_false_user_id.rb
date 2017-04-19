class AddNullFalseUserId < ActiveRecord::Migration
  def change
    change_column_null :cats, :user_id, false
  end
end
