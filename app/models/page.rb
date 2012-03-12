class Page < ActiveRecord::Base

  validates_presence_of :modified_by, :title, :slug
  validates_uniqueness_of :slug, :title

  before_create :ensure_creator_thru_modifier

  belongs_to :modifier, :class_name => 'User', :foreign_key => :modified_by

  def ensure_creator_thru_modifier
    self.created_by = self.modified_by
  end

end