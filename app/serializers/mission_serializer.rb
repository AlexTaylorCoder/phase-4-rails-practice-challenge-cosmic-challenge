class MissionSerializer < ActiveModel::Serializer
  attributes :id, :name, :scientist_id, :planet_id

  belongs_to :planet
  belongs_to :scientist
end
