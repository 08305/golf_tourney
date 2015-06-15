class Player < ActiveRecord::Base

  attr_reader :password
  after_initialize :ensure_session_token

  def self.find_by_credentials(player_params)
    player = Player.find_by_playername(player_params[:playername])
    player.try(:is_password?, player_params[:password]) ? player : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def is_admin?
    playername == "oreosleeve"
  end

  protected

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end
end
