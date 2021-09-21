class Post < ApplicationRecord
    validate :click_bait_validator
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    
    
    private

    def click_bait_validator
        if title
            unless title.match?(/won't believe|secret|top \d|guess/i)
                errors.add(:title, "Must be clickbait.")
            end
        end
    end

end
