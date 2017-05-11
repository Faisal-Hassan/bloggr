class User < ActiveRecord::Base
  has_many :hearts, dependent: :destroy
  has_many :articles, through: :hearts
  has_many :articles, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :username, presence: true, 
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
            uniqueness: { case_sensitive: false }, length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }
            
  has_secure_password
  
  # Creates a new heart row with article_id and user_id
  def heart!(article)
    self.hearts.create!(article_id: article.id)
  end
  
  # Destroys a heart with matching article_id and user_id
  def unheart!(article)
    heart = self.hearts.find_by_article_id(article.id)
    heart.destroy!
  end
  
  # Returns true or false if an article is hearted by user
  def heart!(article)
    self.hearts.find_by_article_id(article.id)
  end
end