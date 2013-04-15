class User
  include Mongoid::Document
  include Mongoid::Timestamps

  authenticates_with_sorcery!

  field :username, type: String
  field :crypted_password, type: String
  field :salt, type: String

  attr_accessor :password, :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password , :on=> :create
  validates_presence_of :username
  validates_uniqueness_of :username
end
