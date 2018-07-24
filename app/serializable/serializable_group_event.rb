class SerializableGroupEvent < JSONAPI::Serializable::Resource
  type :group_event

  attributes :name, :description, :number_days, :duration, :location, :start_date, :end_date, :published

  attribute :is_removed do
    !@object.deleted_at.nil?
  end
end
