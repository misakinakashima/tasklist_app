class Task < ApplicationRecord
    validates :title, presence: true

    enum :status, ready: 1, progress: 2, complate: 3, pend: 4

    has_and_belongs_to_many :tags
end
