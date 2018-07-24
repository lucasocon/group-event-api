class GroupEvent < ApplicationRecord
  acts_as_paranoid
  include SerializableResource

  before_save :calculate_duration
  validate :validate_delete

  def calculate_duration
    self.duration = end_date - start_date if start_date && end_date
  end

  def calculate_duration_in_hours
    TimeDifference.between(start_date, end_date).humanize if start_date && end_date
  end

  def published_event
    update!(published: true) if all_fields_present?
  end

  def validate_delete
    errors.add(:general, 'cannot update delete records') if deleted?
  end

  private

  def all_fields_present?
    name.present? &&
      description.present? &&
      duration.present? &&
      location.present? &&
      start_date.present? &&
      end_date.present?
  end
end
