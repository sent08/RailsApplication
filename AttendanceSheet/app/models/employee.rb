class Employee < ActiveRecord::Base
  # Attribuctes
  attr_accessor :password_create

  # Association
  has_one :employee_detail
  has_and_belongs_to_many :groups
  belongs_to :employee_role
  has_many :attendances, :order => "attendances.signin_datetime desc"
  #Named Scopes
  named_scope :admin, :include => 'groups', :conditions => "groups.name = 'admin'"

  # Validations
  validates_presence_of :email, :password
  validates_confirmation_of :password
  validates_length_of :user_name, :within => 4..32, :on => :create
  validates_uniqueness_of :user_name
  validates_format_of :user_name, :with => /^[-A-Z0-9._+]+$/i

  validates_length_of :email, :within => 6..100, :on => :save
  validates_uniqueness_of :email, :on => :save
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :save

  validates_confirmation_of :password, :if => :validate_password?
  validates_length_of :password, { :minimum => 5, :if => :validate_password? }
  validates_length_of :password, { :maximum => 40, :if => :validate_password? }

  # Call Backs

  # Access Control
  def can_create?(resource)
    resource.creatable_by? self
  end

  def can_read?(resource)
    resource.readable_by? self
  end

  def can_update?(resource)
    resource.updatable_by? self
  end

  def can_delete?(resource)
    resource.deletable_by? self
  end

  def updatable_by?(user)
    user.admin?
  end

  def creatable_by?(user)
    user.admin?
  end

  def deletable_by?(user)
    user.admin?
  end
  # Current User

  class << self
    def anonymous
      @anonymous ||= AnonymousUser.new
    end

    def current
      Thread.current[:user] || anonymous
    end

    def current=(user)
      Thread.current[:user] = user
    end
  end
  def logged_in?
    true
  end

  def logged_out?
    false
  end

  def self.authenticate(login, pass)
    begin
      u = find(:first, :conditions => ["user_name = ? ", login])
      return find(:first, :conditions => ["user_name = ? AND crypted_password = ? ", login, crypted_password(u.salt, hashed(pass))])
    rescue
      return nil
    end
  end

  def admin?
    self.groups.include?(Group.find_by_name('admin'))
  end

  protected

  attr_accessor :password, :password_confirmation

  def validate_password?
    @password_create
  end

  def self.hashed(str)
    return Digest::SHA1.hexdigest("change-me--#{str}--")[0..39] #TODO: change me...seriously
  end

  def self.crypted_password(salt, hashed_password)
    hashed(salt + hashed_password)
  end
  after_validation :crypt_password
  def crypt_password
    if @password_create
      write_attribute("salt", self.class.hashed("salt-#{Time.now}"))
      write_attribute("crypted_password", self.class.crypted_password(salt, self.class.hashed(@password)))
    end
  end

  def self.crypted_password(salt, hashed_password)
    hashed(salt + hashed_password)
  end

  # Overrides a few properties
  def logged?; false end
end
