module Tlalok
  module Adapter
    module Ospi
      class CLI < Thor

        map ["run", "start", "open"] => "on"
        desc "on STATION_NUM", "Turn STATION_NUM on"
        def on(station)
          controller = Controller.new
          controller.open station.to_i
        end

        map ["stop", "close"] => "off"
        desc "off STATION_NUM", "Turn STATION_NUM off"
        def off(station)
          controller = Controller.new
          controller.close station.to_i
        end
      end
    end
  end
end
