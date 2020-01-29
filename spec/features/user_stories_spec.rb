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
end
