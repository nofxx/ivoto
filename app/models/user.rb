class User < ActiveRecord::Base

  has_many :ties
  has_many :farms, :through => :ties
  has_many :cultures, :through => :farms
  has_many :contacts, :as => :contactable
  has_many :addresses, :as => :addressable

  has_and_belongs_to_many :regions
  accepts_nested_attributes_for :ties,      :allow_destroy => true
  accepts_nested_attributes_for :contacts,  :allow_destroy => true
  accepts_nested_attributes_for :addresses, :allow_destroy => true

  named_scope :technic, :conditions => { :kind => :technic }
  named_scope :owner,   :conditions => { :kind => :owner   }
  named_scope :admin,   :conditions => { :kind => :admin   }

  symbolize :kind, :in => [:admin, :technic, :owner]

  acts_as_authentic do |c|
    c.crypto_provider Authlogic::CryptoProviders::BCrypt
    c.logged_in_timeout 30.minutes
    c.validates_length_of_login_field_options :within => 3..30
    # c.validates_format_of_login_field_options :with => /A\w[w\.\-_@ ]+z/, :message => I18n.t('authlogic.validates.format_login_field')
    c.validates_uniqueness_of_login_field_options :allow_blank => false
  end

  def before_validation
    self.time_zone ||= "Brasilia"
    self.locale ||= I18n.default_locale
  end

  def active?
    true #state == :active
  end

  def activate!
    self.update_attribute(:state, :active)
  end

  def city
    addresses.first.try(:city).try(:name)
  end

  #attr_accessible :login, :email, :name, :password, :kind, :password_confirmation
  #has_many :news

end



# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  login               :string(80)      not null
#  kind                :string(80)      not null
#  email               :string(100)
#  name                :string(100)     default("")
#  state               :string(255)     default("passive"), not null
#  crypted_password    :string(255)     not null
#  password_salt       :string(255)     not null
#  persistence_token   :string(255)
#  single_access_token :string(255)
#  perishable_token    :string(255)
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  time_zone           :string(50)      not null
#  locale              :string(50)      not null
#  last_login_at       :timestamp
#  last_request_at     :timestamp
#  current_login_at    :timestamp
#  login_count         :integer
#  doc                 :string(20)
#  reg                 :string(20)
#  created_at          :timestamp
#  updated_at          :timestamp
#

