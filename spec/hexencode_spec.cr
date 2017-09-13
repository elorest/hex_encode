require "./spec_helper"

describe Hexencode do
  it "should return hex code for given string" do 
    str_bytes = "this should work".to_slice
    Hexencode.encode(str_bytes).should eq str_bytes.hexstring
  end

  it "should return hex code for given file" do 
    file_bytes = File.read("LICENSE").to_slice
    Hexencode.encode(file_bytes).should eq file_bytes.hexstring
  end
  #
  it "should decode hex code for encoded string" do 
    str = "746869732073686f756c6420776f726b"
    base_string = "this should work"
    Hexencode.decode(str).should eq base_string.to_slice
  end
  #
  it "should decode hex code for encoded string and return string" do 
    str = "746869732073686f756c6420776f726b"
    Hexencode.decode_string(str).should eq "this should work"
  end
end
