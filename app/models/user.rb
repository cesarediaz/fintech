class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validate :strong_password

  def self.weak_words
    %w(password mypassword)
  end

  private

  def strong_password
    errors.add(:password, 'too weak') if User.weak_words.include?(password)
  end
end
