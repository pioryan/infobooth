class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  has_many :pages, :foreign_key => :modified_by
  has_many :user_roles
  has_many :roles, :through => :user_roles


  def admin?
    self.roles.include?(Role.admin)
  end

  def has_role?(*roles)
    self.roles.where(:name => roles)
  end

  private


end
