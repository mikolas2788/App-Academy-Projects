class User < ApplicationRecord

    attr_reader :password

    validates :username, :password_digest, :session_token, presence: true 
    validates :username, uniqueness: true
    validates :password, length: { minimum: 6 }, allow_nil: true

    after_initialize :ensure_session_token

    def self.generate_session_token
        debugger
        SecureRandom::urlsafe_base64(16)
    end 

    def self.find_by_credentials(username, password)
        debugger
        user = User.find_by(username: username)
        debugger
        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end 

    def password=(password)
        @password = password
        debugger
        self.password_digest = BCrypt::Password.create(password)
    end 

    def is_password?(password)
        debugger
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end 

    def reset_session_token!
        debugger
        self.session_token = self.class.generate_session_token
        debugger
        self.save!
        debugger
        self.session_token
    end 

    private
    def ensure_session_token
        debugger
        self.session_token ||= self.class.generate_session_token
    end 
    
end
