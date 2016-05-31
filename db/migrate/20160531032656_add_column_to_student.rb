class AddColumnToStudent < ActiveRecord::Migration
  def change
    add_column :students, :birthdate, :date
  end
end
