class User < ApplicationRecord
  validates :password, presence: true, length: { minimum: 6 }
  validates :name, presence: true
  validates :email, presence: true
  validate :validate_email

  private

  # email属性が有効なメールアドレスフォーマットであることを検証するメソッド
  def validate_email
      unless email =~ URI::MailTo::EMAIL_REGEXP
      errors.add(:email, "is not a valid email format")
      end
  end
end
