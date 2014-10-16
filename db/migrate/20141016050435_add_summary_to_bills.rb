class AddSummaryToBills < ActiveRecord::Migration
  def change
    add_column :bills, :summary, :string
    add_column :bills, :category, :string
    add_column :bills, :title, :string
  end
end
