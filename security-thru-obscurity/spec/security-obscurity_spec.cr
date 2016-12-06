require "./spec_helper"

describe Security::Obscurity do
  it "can find a legitimate room" do
    Security::Obscurity.check_room("aaaaa-bbb-z-y-x-123[abxyz]").should eq true
  end
end
