class Step < ApplicationRecord
  belongs_to :tutorial, optional: true

  before_save :downcase_fields

  def downcase_fields
    self.title.downcase!
  end
end
