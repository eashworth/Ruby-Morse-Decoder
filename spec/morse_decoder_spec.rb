require 'morse_decoder.rb'

describe Morse_decoder do
  subject(:morse_decoder) { described_class }

  it 'responds to decode_morse_character' do
    expect(morse_decoder).to respond_to(:decode_morse_character).with(1).argument
  end
  describe '.decode_morse_character' do
    it 'converts any single Morse character to English' do
      expect(morse_decoder.decode_morse_character(".-")).to eq("A")
      expect(morse_decoder.decode_morse_character("-...")).to eq("B")
      expect(morse_decoder.decode_morse_character("-.-.")).to eq("C")
    end
  end
  describe '.decode_morse_sentence' do
    it 'converts any single Morse word to English' do
      expect(morse_decoder.decode_morse_word(".... . .-.. .-.. ---")).to eq("HELLO")
      expect(morse_decoder.decode_morse_word(".-- --- .-. .-.. -..")).to eq("WORLD")
      expect(morse_decoder.decode_morse_word("--. --- --- -.. -... -.-- .")).to eq("GOODBYE")
    end
  end
  describe '.decode_morse_sentence' do
    it 'converts any Morse code sentence to English' do
      expect(morse_decoder.decode_morse_sentence(".... . .-.. .-.. ---/.-- --- .-. .-.. -..")).to eq("HELLO WORLD")
      expect(morse_decoder.decode_morse_sentence("--. --- --- -.. -... -.-- ./.-- --- .-. .-.. -..")).to eq("GOODBYE WORLD")
      expect(morse_decoder.decode_morse_sentence(".- -... -.-. --..--/.---- ..--- ...-- --..--/-.- . . .--./-.-. --- -.. .. -. --. -.-.--")).to eq("ABC, 123, KEEP CODING!")
    end
  end
  describe '.decode_morse' do
    it 'converts any Morse input to English, whether char, word or sentence' do
      expect(morse_decoder.decode_morse(".-")).to eq("A")
      expect(morse_decoder.decode_morse(".... . .-.. .-.. ---")).to eq("HELLO")
      expect(morse_decoder.decode_morse(".... . .-.. .-.. ---/.-- --- .-. .-.. -..")).to eq("HELLO WORLD")
    end
  end

end
