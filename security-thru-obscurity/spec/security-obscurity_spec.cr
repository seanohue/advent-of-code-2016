require "./spec_helper"

describe Security::Obscurity do
  
  describe "#check_room" do
    it "can find a legitimate room" do
      Security::Obscurity.check_room("aaaaa-bbb-z-y-x-123[abxyz]").should eq true
    end

    it "can find a legit room using tiebreaker" do
      Security::Obscurity.check_room("a-b-c-d-e-f-g-h-987[abcde]").should eq true
    end

    it "can find a decoy room" do 
      Security::Obscurity.check_room("totally-real-room-200[decoy]").should eq false
    end
  end

end
