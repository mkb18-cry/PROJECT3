class Tutorial < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :user
  belongs_to :tag_programming
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps,
                                allow_destroy: true,
                                # reject_if: proc { |att| att['tutorial_id'].blank? }
                                reject_if: :all_blank

  validates :title, presence: true
  before_save :downcase_fields

  def downcase_fields
    self.title.downcase!
  end
  
end
