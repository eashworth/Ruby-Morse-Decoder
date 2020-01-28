require 'morse_decoder.rb'

describe Morse_decoder do
  subject(:morse_decoder) { described_class.new }

  it 'responds to decode_morse_character' do
    expect(morse_decoder).to respond_to(:decode_morse_character).with(1).argument
  end
end
