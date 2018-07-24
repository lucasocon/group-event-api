module NotificationHelper
  FLASH_TYPES = {
    'success' => 'success',
    'error' => 'danger',
    'alert' => 'warning',
    'notice' => 'info'
  }

  def bootstrap_class_for_flash(flash_type)
    FLASH_TYPES[flash_type] || flash_type.to_s
  end
end
