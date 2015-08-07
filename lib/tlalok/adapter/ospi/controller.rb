module Tlalok
  module Adapter
    module Ospi
      class Controller

        # wiring pi pin numbers
        CLOCK_PIN = 7
        DATA_PIN = 2
        PIN_SR_NOE = 0
        LATCH_PIN = 3

        NUMBER_OF_STATIONS = 8

        def initialize(io = nil)
          @stations = [0] * 8
          @io = io || WiringPi::GPIO.new do |gpio|
            # Set the pinmode of pin 0 for output
            gpio.pin_mode(CLOCK_PIN, 1)
            gpio.pin_mode(DATA_PIN, 1)
            gpio.pin_mode(PIN_SR_NOE, 1)
            gpio.pin_mode(LATCH_PIN, 1)
          end
        end

        def open(station_number)
          set_station station_number, 1
        end

        def close(station_number)
          set_station station_number, 0
        end

        def close_all()
          @stations = [0] * 8
          send_array @stations
        end

        def set_station(station_number, status)
          station_index = station_number - 1
          @stations[station_index] = status
          send_array @stations
        end

        def send_array(array)
          @io.digital_write(LATCH_PIN, 0)
          @io.shift_out(DATA_PIN, CLOCK_PIN, 0, array.join.to_i(2))
          @io.digital_write(LATCH_PIN, 1)
        end


      end
    end
  end
end
