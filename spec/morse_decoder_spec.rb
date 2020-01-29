require 'morse_decoder.rb'

describe Morse_decoder do
  subject(:morse_decoder) { described_class.new }

  it 'responds to decode_morse_character' do
    expect(morse_decoder).to respond_to(:decode_morse_character).with(1).argument
  end
  describe '#decode_morse_character' do
    it 'converts any single morse character to a letter of the English alphabet' do
      expect(morse_decoder.decode_morse_character(".-")).to eq("A")
      expect(morse_decoder.decode_morse_character("-...")).to eq("B")
      expect(morse_decoder.decode_morse_character("-.-.")).to eq("C")
    end
  end
end
