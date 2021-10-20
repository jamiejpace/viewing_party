class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.parse_party_time(time_params)
    Time.zone.parse(
      "#{time_params['time(1i)']}-#{time_params['time(2i)']}-#{time_params['time(3i)']}
      -#{time_params['time(4i)']}-#{time_params['time(5i)']}"
    )
  end
end
