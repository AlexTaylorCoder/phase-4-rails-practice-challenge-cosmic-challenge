class Mission < ApplicationRecord
    belongs_to :scientist 
    belongs_to :planet

    validates :name, presence: true
    validates :planet_id, uniqueness: true
    # Same scientist shouldn't have same planet
end
