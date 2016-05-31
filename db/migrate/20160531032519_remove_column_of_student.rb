class RemoveColumnOfStudent < ActiveRecord::Migration
  def change
    remove_column :students, :age
  end
end
