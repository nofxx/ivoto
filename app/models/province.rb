class Province < ActiveRecord::Base
  has_many :regions
 validates_presence_of :name, :abbr

end


# == Schema Information
#
# Table name: provinces
#
#  id         :integer         not null, primary key
#  country_id :integer
#  abbr       :string(3)
#  name       :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#

