class Page < ActiveRecord::Base

  validates_presence_of :title, :slug
  validates_uniqueness_of :slug, :title

  before_create :set_created_by
  before_save :set_modified_by

  belongs_to :modifier, :class_name => 'User', :foreign_key => :created_by

  def set_modified_by
    self.modified_by = current_actor.id unless self.modified_by
  end

  def set_created_by
    self.created_by = current_actor.id unless self.created_by
  end

end