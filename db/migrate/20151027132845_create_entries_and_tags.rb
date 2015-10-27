class CreateEntriesAndTags < ActiveRecord::Migration
  def change
    create_table :entries_tags, id: false do |t|
    	t.belongs_to :entry, index: true
    	t.belongs_to :tag, index: true
    end
  end
end