class Account < ActiveRecord::Base
  has_many :users
  has_many :jars 
  
  validates_uniqueness_of :name, :case_sensitive => false
  validates_presence_of :name
end
