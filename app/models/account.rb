class Account < ActiveRecord::Base
  has_many :users
  
  validates_uniqueness_of :name, :case_sensitive => false
  validates_presence_of :name
  
  before_create :set_default_values

  
  def self.days 
    {
        "1" => "Monday" ,
        "2" => "Tuesday" ,
        "3" => "Wednesday" ,
        "4" => "Thursday" ,
        "5" => "Friday" ,
        "6" => "Saturday",
        "7" => "Sunday"
    }
  end
  
  private
   def set_default_values
     self.time_zone = 'Kathmandu'
     self.office_closing_days = "6,7"
     self.fine_amount = 15.0
   end
end
