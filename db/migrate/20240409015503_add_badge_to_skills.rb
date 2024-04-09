class AddBadgeToSkills < ActiveRecord::Migration[7.1]
  def change
    add_column :skills, :badge, :text
  end
end
