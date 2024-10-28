class Task < ApplicationRecord

    validates :title, presence: true
    enum :status, [ :draft, :published, :archived, :trashed ]

end
