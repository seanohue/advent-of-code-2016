require "./spec_helper"

describe Security::Obscurity do
  
  describe "#check_room" do
    it "can find a legitimate room" do
      Security::Obscurity.check_room("aaaaa-bbb-z-y-x-123[abxyz]").should eq true
    end

    it "can find a legit room using tiebreaker" do
      Security::Obscurity.check_room("a-b-c-d-e-f-g-h-987[abcde]").should eq true
    end

    it "can find another trickier legit room" do
      Security::Obscurity.check_room("not-a-real-room-404[oarel]").should eq true
    end

    it "can find a decoy room" do 
      Security::Obscurity.check_room("totally-real-room-200[decoy]").should eq false
    end
  end

  describe "#get_check_sum" do
    it "can pull check sum from hash" do
      Security::Obscurity.get_check_sum("aaaaa-bbb-z-y-x-123[abxyz]").should eq "abxyz"
    end
  end

  describe "#get_encrypted_name" do
    it "can pull encrypted name from hash" do 
      Security::Obscurity.get_encrypted_name("a-b-c-d-e-f-g-h-987[abcde]", "abcde").should eq "abcdefgh"
    end
  end

  describe "#get_room_number" do
    it "can get three digit room number from hash" do
      Security::Obscurity.get_room_number("a-b-c-d-e-f-g-h-987[abcde]", "abcde").should eq "987"
    end
  end

  describe "#sum_legit_rooms" do
    it "can sum the room numbers of legitimate rooms" do
      room_str = "aaaaa-bbb-z-y-x-123[abxyz]
                  a-b-c-d-e-f-g-h-987[abcde]"
      expected_sum = 123 + 987
      Security::Obscurity.sum_legit_rooms(room_str).should eq expected_sum
    end
  
    it "can sum several room numbers of legit rooms" do
      room_str = "aaaaa-bbb-z-y-x-123[abxyz]
                  a-b-c-d-e-f-g-h-987[abcde]
                  not-a-real-room-404[oarel]
                  totally-real-room-200[decoy]"
      expected_sum = 1514
      Security::Obscurity.sum_legit_rooms(room_str).should eq expected_sum
    end
  end

  describe "#get_rooms_by_str" do
    it "can split a string of room names into an array of names" do
      room_str = "aczupnetwp-mfyyj-opalcexpye-977[peyac]
                  qzchnzbshud-cxd-trdq-sdrshmf-105[jqexn]"
      room_array = ["aczupnetwp-mfyyj-opalcexpye-977[peyac]",
                  "qzchnzbshud-cxd-trdq-sdrshmf-105[jqexn]"]
      Security::Obscurity.get_rooms_by_str(room_str).should eq room_array
    end
  end


end
