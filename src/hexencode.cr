require "./hexencode/*"

module Hexencode
  MAPPING = "0123456789abcdef".chars
  extend self
  
  def encode(bytes : Bytes)
    output = String.build do |str|
      bytes.each do |b|
        str << MAPPING[(b >> 4)]
        str << MAPPING[(b & 15)]
      end
    end
  end

  def decode(hexstring : String)
    output = Array(UInt8).new
    hexstring.chars.each_slice(2) do |pair|
      output << (MAPPING.index(pair.first).to_s.to_u8 << 4)
      output[output.size - 1] |= MAPPING.index(pair.last).to_s.to_u8
    end

    output.to_unsafe.to_slice(output.size)
  end

  def decode_string(hexstring : String)
    String.new(decode(hexstring))
  end
end
