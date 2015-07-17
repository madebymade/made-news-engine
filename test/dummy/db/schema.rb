# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150717113900) do

  create_table "news_authors", :force => true do |t|
    t.text     "bio"
    t.string   "first_name"
    t.string   "twitter"
    t.string   "type"
    t.string   "url"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "role"
    t.string   "google_plus_url"
    t.string   "surname"
  end

  add_index "news_authors", ["type"], :name => "index_news_authors_on_type"
  add_index "news_authors", ["url"], :name => "index_news_authors_on_url", :unique => true

  create_table "news_categories", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "type"
    t.integer  "order",      :default => 9999
  end

  add_index "news_categories", ["order"], :name => "index_news_categories_on_order"
  add_index "news_categories", ["type"], :name => "index_news_categories_on_type"

  create_table "news_items", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "sticky"
    t.string   "url"
    t.string   "lead_image_file_name"
    t.string   "lead_image_content_type"
    t.integer  "lead_image_file_size"
    t.datetime "lead_image_updated_at"
    t.integer  "author_id"
    t.boolean  "published",               :default => false
  end

  add_index "news_items", ["created_at"], :name => "index_news_items_on_created_at"
  add_index "news_items", ["sticky"], :name => "index_news_items_on_sticky"
  add_index "news_items", ["url"], :name => "index_news_items_on_url"

  create_table "news_related_links", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.string   "url"
    t.integer  "item_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "order",              :default => 9999
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "news_tags", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "order",             :default => 9999
    t.string   "intro_title"
    t.text     "intro_description"
  end

  add_index "news_tags", ["url"], :name => "index_news_tags_on_url"

  create_table "news_taxonomies", :force => true do |t|
    t.integer  "news_item_id"
    t.integer  "taxonomable_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "order",            :default => 9999
    t.string   "taxonomable_type", :default => "News::Tag"
    t.string   "type"
  end

  add_index "news_taxonomies", ["news_item_id"], :name => "index_news_taxonomies_on_news_id"
  add_index "news_taxonomies", ["taxonomable_id"], :name => "index_news_taxonomies_on_tag_id"

end
