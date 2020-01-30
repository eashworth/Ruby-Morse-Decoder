describe 'User stories' do

  # User story 1:
  # As an English speaker
  # So I can begin understanding Morse code
  # I would like to translate any single Morse code character to English

  it 'So I can begin understanding Morse code, translate any single Morse code character to English' do
    expect(Morse_decoder.decode_morse_character(".-")).to eq("A")
    expect(Morse_decoder.decode_morse_character("-...")).to eq("B")
    expect(Morse_decoder.decode_morse_character("-.-.")).to eq("C")
    expect(Morse_decoder.decode_morse_character(".-..-.")).to eq('"')
  end

  # User story 2:
  # As an English speaker
  # So I can understand words in Morse code
  # I would like to translate a word in Morse code to English

  it 'So I can understand words in Morse code, translate a word in Morse to English' do
    expect { Morse_decoder.decode_morse_word(".... . .-.. .-.. ---") }.not_to raise_error
    expect(Morse_decoder.decode_morse_word(".... . .-.. .-.. ---")).to eq("HELLO")
    expect(Morse_decoder.decode_morse_word(".-- --- .-. .-.. -..")).to eq("WORLD")
    expect(Morse_decoder.decode_morse_word("--. --- --- -.. -... -.-- .")).to eq("GOODBYE")
    expect(Morse_decoder.decode_morse(".---- ..--- ...-- ....- ..... -.... --... ---.. ----. -----")).to eq("1234567890")
    expect(Morse_decoder.decode_morse(".-... .----. .--.-. -.--.- -.--. ---... --..-- -...- -.-.-- .-.-.- -....- .-.-. ..--.. -..-.")).to eq("&'@)(:,=!.-+?/")
  end

  # User story 3:
  # As an English speaker
  # So I can understand a sentence in Morse code
  # I would like to translate a sentence in Morse code to English

  it 'So I can understand a sentence in Morse code, translate a sentence in Morse to English' do
    expect(Morse_decoder.decode_morse_sentence(".... . .-.. .-.. ---/.-- --- .-. .-.. -..")).to eq("HELLO WORLD")
    expect(Morse_decoder.decode_morse_sentence("--. --- --- -.. -... -.-- ./.-- --- .-. .-.. -..")).to eq("GOODBYE WORLD")
    expect(Morse_decoder.decode_morse_sentence("- .... ./--.- ..- .. -.-. -.-/-... .-. --- .-- -./..-. --- -..-/.--- ..- -- .--. . -../--- ...- . .-./- .... ./.-.. .- --.. -.--/-.. --- --.")).to eq("THE QUICK BROWN FOX JUMPED OVER THE LAZY DOG")
  end

  # User story 4:
  # As an English speaker
  # So I can understand any message in Morse code
  # I want to translate Morse input, regardless of whether it is a character, word or sentence

  it 'So I can understand any message in Morse code, I want to translate Morse input, regardless of whether it is a character, word or sentence' do
    expect(Morse_decoder.decode_morse(".-")).to eq("A")
    expect(Morse_decoder.decode_morse(".... . .-.. .-.. ---")).to eq("HELLO")
    expect(Morse_decoder.decode_morse(".... . .-.. .-.. ---/.-- --- .-. .-.. -..")).to eq("HELLO WORLD")
  end

  # User story 5:
  # As an English speaker
  # So I can identify whether a message is in Morse code
  # I want to be told if the message input is not valid Morse code

  it 'So I can identify whether a message is in Morse code, I want to be told if the message input is not valid Morse code' do
    expect { Morse_decoder.decode_morse("A") }.to raise_error("Unable to decode: input is not valid Morse code.")
    expect { Morse_decoder.decode_morse("") }.to raise_error("Unable to decode: input is an empty string.")
  end

end
