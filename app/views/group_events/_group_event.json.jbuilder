json.extract! group_event, :id, :name, :description, :duration, :location, :published, :number_days, :start_date, :end_date
json.url group_event_url(group_event, format: :json)
