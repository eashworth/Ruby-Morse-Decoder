describe 'User stories' do

  # User story 1:
  # As an English speaker
  # So I can begin understanding Morse code
  # I would like to translate any single Morse code character to English

  it 'So I can begin understanding Morse code, translate any single Morse code character to English' do
    morse_decoder = Morse_decoder.new
    expect { morse_decoder.decode_morse_character("A") }.not_to raise_error
    expect(morse_decoder.decode_morse_character(".-")).to eq("A")
    expect(morse_decoder.decode_morse_character("-...")).to eq("B")
    expect(morse_decoder.decode_morse_character("-.-.")).to eq("C")
  end

  # User story 2:
  # As an English speaker
  # So I can understand words in Morse code
  # I would like to translate a word in Morse code to English

  it 'So I can understand words in Morse code, translate a word in Morse to English' do
    morse_decoder = Morse_decoder.new
    expect { morse_decoder.decode_morse_word(".... . .-.. .-.. ---") }.not_to raise_error
    expect(morse_decoder.decode_morse_word(".... . .-.. .-.. ---")).to eq("HELLO")
    expect(morse_decoder.decode_morse_word(".-- --- .-. .-.. -..")).to eq("WORLD")
    expect(morse_decoder.decode_morse_word("--. --- --- -.. -... -.-- .")).to eq("GOODBYE")
  end

end
