class AddTopicReferenceToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_reference :blogs, :topic, foreign_key: true
  end
end
