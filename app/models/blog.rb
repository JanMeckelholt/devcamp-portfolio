class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :topic_id

  belongs_to :topic

  has_many :comments, dependent: :destroy

  def self.by_updated_at
    order("updated_at DESC")
  end
  def self.by_created_at
    order("created_at DESC")
  end

  def self.published
     where(status: :published)
  end
  def self.draft
     where(status: :draft)
  end
end
