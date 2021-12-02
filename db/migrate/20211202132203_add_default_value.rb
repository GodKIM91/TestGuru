class AddDefaultValue < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:answers, :correct, from: nil, to: false)
    change_column_default(:tests, :level, from: nil, to: 0)
  end
end
