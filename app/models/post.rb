class Post < ApplicationRecord

  BAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
  ]

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  
  validate :clickbaity



  # def clickbaity
  #   if title.include? "Won't Believe" || "Secret" || "Top [number]" || "Guess" == false
  #     errors.add(:title, "not clickbait-y enough")
  #   end
  # end

  def clickbaity
    if BAIT_PATTERNS.none? { |pattern| pattern.match(title) }
      errors.add(:title, "must be clickbait")
    end
  end

end
