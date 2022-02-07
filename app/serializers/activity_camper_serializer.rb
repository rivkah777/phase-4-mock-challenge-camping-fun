class ActivityCamperSerializer < ActiveModel::Serializer
  attributes :id,:name, :age 
  has_many :activities, through: :camper_activities
end
