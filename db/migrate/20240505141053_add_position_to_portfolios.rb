class AddPositionToPortfolios < ActiveRecord::Migration[7.1]
  def change
    add_column :portfolios, :position, :integer
  end
end
