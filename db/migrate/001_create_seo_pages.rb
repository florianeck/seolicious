class CreateSeoPages < ActiveRecord::Migration
  
  def change
    create_table "seo_pages", force: :cascade do |t|
      t.string  "name",            limit: 255
      t.string  "controller_name",  limit: 255
      t.string  "action_name",      limit: 255
      t.text    "params_json",      limit: 65535
      t.string  "title",            limit: 255
      t.text    "meta_description", limit: 65535
      t.text    "meta_keywords",    limit: 65535
      t.string  "og_title",            limit: 255
      t.string  "og_description",            limit: 255
      t.string  "og_image",            limit: 255
      t.boolean "no_index",                       default: false
      t.boolean "hidden",                         default: false
    end
  end
  
end