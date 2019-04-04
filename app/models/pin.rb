class Pin < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    def self.sizes
        {
          thumbnail: { resize_to_limit: [30, 30] },
          full:     { resize_to_limit: [100, 100] }
        }
      end
    
    def sized(size)
        image.variant(Pin.sizes[size]).processed
    end
end
