require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :comments
  has_many :posts
  validates_presence_of :username
  validates_uniqueness_of :username

  attr_accessor :password_confirmation
  validates_confirmation_of :password

  def self.get_users_with_email
    find(:all, :conditions => {:email => 'haha'})
  end
  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password,self.salt)    
  end

  def after_destroy
    if User.count.zero?
      raise "can't delete last user"
    end
  end

  def self.authenticate(name, password)
    user = self.find_by_username(name)
    if user
      expected_password = User.encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    return user
  end
  private

  def password_non_blank
    errors.add(:password, "Missing Password") if hashed_password.blank?
  end

  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

end
