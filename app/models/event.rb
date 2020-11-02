class Event < ApplicationRecord
    require 'csv'

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            Event.create! row.to_hash
        end
    end

    def self.to_csv
        attributes = %w{name, date, description, event_type, location}

        CSV.generate(headesr: true) do |csv|
            csv << attributes
            all.each do |event|
                csv << [event.name, event.date, event.description, event.event_type, event.location]
            end
        end
    end

end
