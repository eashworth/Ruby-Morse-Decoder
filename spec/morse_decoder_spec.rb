require 'morse_decoder.rb'

describe Morse_decoder do
  it 'converts a single Morse character to English' do
    expect(subject).to respond_to(:decode_morse_character).with(1).argument
  end
end
