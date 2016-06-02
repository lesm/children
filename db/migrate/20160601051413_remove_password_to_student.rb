class RemovePasswordToStudent < ActiveRecord::Migration
  def change
    remove_column :students, :password, :string
  end
end
