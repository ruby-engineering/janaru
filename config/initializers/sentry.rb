# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = ENV.fetch('SENTRY_DSN') if Rails.env.production? || Rails.env.staging?
  config.enabled_environments = %w[production staging]
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 0.1
end
