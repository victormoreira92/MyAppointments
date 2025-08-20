class AppointmentValidator < ActiveModel::Validator
  def validate(record)
    return unless record.start_time
    appointment_hours_is_valid?(record)
    appointment_days_is_valid?(record)
    appintments_is_overlapping?(record)
  end
  private
  def appointment_hours_is_valid?(record)
    if record.start_time.hour < 9 || record.start_time.hour > 17
      record.errors.add(:start_time, "must be between 9 AM and 5 PM")
    end
  end
  def appointment_days_is_valid?(record)
    if record.start_time.saturday? || record.start_time.sunday?
      record.errors.add(:start_time, "cannot be on weekends")
    end
  end
  def appintments_is_overlapping?(record)
    overlapping_appointments = Appointment.where(
      professional_id: record.professional_id,
      start_time: record.start_time.beginning_of_minute..record.start_time.advance(minutes: Appointment::APPOINTMENT_DURATION_MINUTES)
    )
    if overlapping_appointments.exists?
      record.errors.add(:start_time, "overlaps with another appointment")
    end
  end
end
