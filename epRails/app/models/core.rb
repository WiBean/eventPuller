class Core < ActiveRecord::Base
  validates_uniqueness_of :hexid
  has_many :wibean_event_v1s
end
