class Role < ActiveRecord::Base
  validates_presence_of   :name
  validates_uniqueness_of :name
  has_many  :user_roles
  has_many :users, :through => :user_roles

  def self.method_missing(method_name, *args, &block)
    role = self.all.select{|role| method_name == role.name.to_s.gsub(' ','_').downcase.to_sym }
    unless role.empty?
      role.first
    else
      super
    end
  end
end