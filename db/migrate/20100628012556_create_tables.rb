class CreateTables < ActiveRecord::Migration
  def self.up
    create_table :makes do |t|
      t.string :name
    end

    create_table :cars do |t|
      t.integer :make_id, :null => false, :options => "CONSTRAINT fk_cars_makes REFERENCES makes(id)"
      t.string :name, :year
    end

    create_table :users do |t|
      t.string :username, :hashed_password, :salt
      t.string :firstname, :lastname, :email
    end
    
    create_table :posts do |t|
      t.integer :user_id, :null => false, :options => "CONSTRAINT fk_posts REFERENCES users(id)"
      t.integer :car_id, :null => false, :options => "CONSTRAINT fk_posts REFERENCES cars(id)"
      t.integer :dealer_id, :null => false, :options => "CONSTRAINT fk_posts REFERENCES dealers(id)"
      t.decimal :price_paid, :null => false, :precision => 16, :scale => 2
      t.string :description
    end

    create_table :comments do |t|
      t.integer :user_id, :null => false, :options => "CONSTRAINT fk_comments_users REFERENCES users(id)"
      t.integer :post_id, :null => false, :options => "CONSTRAINT fk_comments_posts REFERENCES posts(id)"
      t.string :body
    end

  end

  def self.down
    drop_table :makes
    drop_table :cars 
    drop_table :users 
    drop_table :posts
    drop_table :comments
  end
end
