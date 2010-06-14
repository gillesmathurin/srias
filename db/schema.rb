# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100614140553) do

  create_table "abonnes", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "fichiers", :force => true do |t|
    t.string   "fichier_file_name"
    t.string   "fichier_content_type"
    t.datetime "fichier_updated_at"
    t.integer  "fichier_file_size"
    t.integer  "manifestation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "liens", :force => true do |t|
    t.string   "nom"
    t.string   "adresse"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "logo_file_size"
    t.string   "logo_file_name"
    t.string   "logo_file_content_type"
    t.datetime "logo_updated_at"
  end

  create_table "manifestations", :force => true do |t|
    t.string   "nom"
    t.string   "lieu"
    t.datetime "date_debut"
    t.datetime "date_fin"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "illustration_content_type"
    t.integer  "illustration_file_size"
    t.string   "illustration_file_name"
    t.datetime "illustration_updated_at"
    t.integer  "mission_id"
    t.boolean  "validate",                  :default => false
    t.string   "fiche_file_name"
    t.integer  "fiche_file_size"
    t.string   "fiche_content_type"
    t.datetime "fiche_updated_at"
  end

  create_table "missions", :force => true do |t|
    t.string   "nom"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletters", :force => true do |t|
    t.string   "titre"
    t.text     "sommaire"
    t.text     "content"
    t.binary   "preview"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "delivered_at"
    t.string   "numero"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "partenaires", :force => true do |t|
    t.string   "nom"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "manifestation_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.integer  "failed_login_count"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

end
