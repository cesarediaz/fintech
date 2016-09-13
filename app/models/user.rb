class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validate :strong_password

  private

  def weak_words
    %w(password mypassword)
  end

  def strong_password
    errors.add(:password, 'too weak') if weak_words.include?(password)
  end
end
