require 'test_helper'

describe ::Tlaloc::Adapter::Ospi::Controller do
  before do
    @io = Minitest::Mock.new
    @controller = ::Tlaloc::Adapter::Ospi::Controller.new(@io)
  end

  describe "opening a station" do
    it "must send the appropriat bitmask for station 4" do

      @io.expect :digital_write, nil, [3, 0]
      @io.expect :digital_write, nil, [3, 1]

      @io.expect :shift_out, nil, [2, 7, 0, 8]
      @controller.open 5
      @io.verify

    end

    it "must send the appropriat bitmask for station 1" do

      @io.expect :digital_write, nil, [3, 0]
      @io.expect :digital_write, nil, [3, 1]

      @io.expect :shift_out, nil, [2, 7, 0, 128]
      @controller.open 1
      @io.verify

    end

    it "must send the appropriat bitmask for station 8" do

      @io.expect :digital_write, nil, [3, 0]
      @io.expect :digital_write, nil, [3, 1]

      @io.expect :shift_out, nil, [2, 7, 0, 1]
      @controller.open 8
      @io.verify

    end
  end


  describe "closing a station" do
    it "must send the appropriat bitmask for station 4" do

      @io.expect :digital_write, nil, [3, 0]
      @io.expect :digital_write, nil, [3, 1]

      @io.expect :shift_out, nil, [2, 7, 0, 0]
      @controller.close 4
      @io.verify

    end

    it "must send the appropriat bitmask for station 1" do

      @io.expect :digital_write, nil, [3, 0]
      @io.expect :digital_write, nil, [3, 1]

      @io.expect :shift_out, nil, [2, 7, 0, 0]
      @controller.close 1
      @io.verify

    end

    it "must send the appropriat bitmask for station 8" do

      @io.expect :digital_write, nil, [3, 0]
      @io.expect :digital_write, nil, [3, 1]

      @io.expect :shift_out, nil, [2, 7, 0, 0]
      @controller.close 8
      @io.verify

    end
  end

  describe "Turning on multiple stations" do
    it "station stays on when starting another station" do

      @io.expect :digital_write, nil, [3, 0]
      @io.expect :digital_write, nil, [3, 1]

      @io.expect :shift_out, nil, [2, 7, 0, 16]
      @controller.open 4
      @io.verify


      @io.expect :digital_write, nil, [3, 0]
      @io.expect :digital_write, nil, [3, 1]

      @io.expect :shift_out, nil, [2, 7, 0, 24]
      @controller.open 5
      @io.verify


    end

  end

end
