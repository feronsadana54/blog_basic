class Post < ApplicationRecord
    has_one_attached :image
    validates :title, presence: true
    validates :body, presence: true 
    validate :validate_image 

    private def validate_image 
        if image.attached? && !image.content_type.in?(%w[image/jpeg image/png])
            errors.add(:image, 'must be a JPEG or PNG')
        elsif image.attached? == false 
            errors.add(:image, 'must be attached')
        end
    end
end
