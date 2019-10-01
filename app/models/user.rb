class User < ApplicationRecord
  has_secure_password
  before_create :create_remember_digest 



  class << self
    
    def digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    
    BCrypt::Password.create(string, cost: cost)
    end
    
    def new_token
    SecureRandom.urlsafe_base64
    end
  end 
  
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end 

end

