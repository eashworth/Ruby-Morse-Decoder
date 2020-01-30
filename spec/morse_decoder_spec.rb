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
      expect(morse_decoder.decode_morse_character(".-..-.")).to eq('"')
    end
    it 'raises an error if the input is not valid Morse code' do
      expect { morse_decoder.decode_morse("A") }.to raise_error("Unable to decode: input is not valid Morse code.")
      expect { morse_decoder.decode_morse("") }.to raise_error("Unable to decode: input is an empty string.")
    end
  end
  describe '.decode_morse_sentence' do
    it 'converts any single Morse word to English' do
      expect(morse_decoder.decode_morse_word(".... . .-.. .-.. ---")).to eq("HELLO")
      expect(morse_decoder.decode_morse_word(".-- --- .-. .-.. -..")).to eq("WORLD")
      expect(morse_decoder.decode_morse_word("--. --- --- -.. -... -.-- .")).to eq("GOODBYE")
      expect(morse_decoder.decode_morse(".---- ..--- ...-- ....- ..... -.... --... ---.. ----. -----")).to eq("1234567890")
      expect(morse_decoder.decode_morse(".-... .----. .--.-. -.--.- -.--. ---... --..-- -...- -.-.-- .-.-.- -....- .-.-. ..--.. -..-.")).to eq("&'@)(:,=!.-+?/")
    end
  end
  describe '.decode_morse_sentence' do
    it 'converts any Morse code sentence to English' do
      expect(morse_decoder.decode_morse_sentence(".... . .-.. .-.. ---/.-- --- .-. .-.. -..")).to eq("HELLO WORLD")
      expect(morse_decoder.decode_morse_sentence("--. --- --- -.. -... -.-- ./.-- --- .-. .-.. -..")).to eq("GOODBYE WORLD")
      expect(morse_decoder.decode_morse_sentence(".- -... -.-. --..--/.---- ..--- ...-- --..--/-.- . . .--./-.-. --- -.. .. -. --. -.-.--")).to eq("ABC, 123, KEEP CODING!")
      expect(morse_decoder.decode_morse_sentence("- .... ./--.- ..- .. -.-. -.-/-... .-. --- .-- -./..-. --- -..-/.--- ..- -- .--. . -../--- ...- . .-./- .... ./.-.. .- --.. -.--/-.. --- --.")).to eq("THE QUICK BROWN FOX JUMPED OVER THE LAZY DOG"
)
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
