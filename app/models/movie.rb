class Movie < ApplicationRecord
    has_many :bookmarks
    # before_destroy :ensure_no_children
    validates :title, uniqueness: :true, presence: true
    validates :overview, presence: true

    # private

    # def ensure_no_children
    #     unless self.children.empty?
    #         self.errors.add_to_base "Can't destroy a movie with bookmarks"
    #         raise ActiveRecord::Rollback
    #     end
    # end
end
