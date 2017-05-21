class Topic < ApplicationRecord

  validates_presence_of :title

  has_many :blogs

  def self.sort_by_id
    order("id ASC")
  end

end
