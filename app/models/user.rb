class User < ActiveRecord::Base
#mount_uploader :avatar, AvatarUploader
#attr_accessible :email, :password_hash, :password_salt, :password, :password_confirmation
  attr_accessor :password,:password_confirmation,:user

  #attr_accessor :password,:password_confirmation,:password_salt
  has_many :visits
 before_save :encrypt_password  
validates_presence_of :email
validates_presence_of :first_name,:last_name,:phone_no
validates_uniqueness_of :email, :case_sensitive => false
validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,message: "Invalid Email" }
 #validates :password, :length => {:within => 6..40}
  validates_confirmation_of :password,message: 'password not matched'
  #validates_presence_of :password_confirmation, message: 'should match confirmation'
  validates_presence_of :password,:message => "Please add password" , :on => :create
  before_save { self.email = email.downcase if email}
 
  
  def self.authenticate(email, password)   
    user = find_by_email(email)  
     if user && user.password_hash == BCrypt::Engine.hash_secret(password,user.password_salt)  
      user  
    else  
      nil  
    end   
end

def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end


def encrypt_password

     if password.present?

      self.password_salt = BCrypt::Engine.generate_salt

      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)

    end  

  end  
  
  
  
end
