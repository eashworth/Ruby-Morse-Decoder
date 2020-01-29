class Morse_decoder
  Morse_to_english_dictionary = {
    ".-"    => "A",
    "-..."  => "B",
    "-.-."  => "C",
    "-.."   => "D",
    "."     => "E",
    "..-."  => "F",
    "--."   => "G",
    "...."  => "H",
    ".."    => "I",
    ".---"  => "J",
    "-.-"   => "K",
    ".-.."  => "L",
    "--"    => "M",
    "-."    => "N",
    "---"   => "O",
    ".--."  => "P",
    "--.-"  => "Q",
    ".-."   => "R",
    "..."   => "S",
    "-"     => "T",
    "..-"   => "U",
    "...-"  => "V",
    ".--"   => "W",
    "-..-"  => "X",
    "-.--"  => "Y",
    "--.."  => "Z",
    "-----" => "0",
    ".----" => "1",
    "..---" => "2",
    "...--" => "3",
    "....-" => "4",
    "....." => "5",
    "-...." => "6",
    "--..." => "7",
    "---.." => "8",
    "----." => "9",
    ".-..." => "&",
    ".----."=> "'",
    ".--.-."=> "@",
    "-.--.-"=> ")",
    "-.--." => "(",
    "---..."=> ":",
    "--..--"=> ",",
    "-...-" => "=",
    "-.-.--"=> "!",
    ".-.-.-"=> ".",
    "-....-"=> "-",
    ".-.-." => "+",
    ".-..-."=> '"',
    "..--.."=> "?",
    "-..--."=> "/"
  }

  def self.decode_morse(morse_message)
    self.check_message_not_empty(morse_message)
    if morse_message.length == 1
      decode_morse_character(morse_message)
    elsif morse_message.include?("/")
      decode_morse_sentence(morse_message)
    else
      decode_morse_word(morse_message)
    end
  end

  private

  def self.check_message_not_empty(morse_message)
    raise "Unable to decode: input is an empty string." if morse_message == ""
  end

  def self.decode_morse_character(morse_character)
    if !Morse_to_english_dictionary.key?(morse_character)
        raise "Unable to decode: input is not valid Morse code."
    else
      return Morse_to_english_dictionary[morse_character]
    end
  end

  def self.decode_morse_word(morse_word)
    english_chars = morse_word.split.map do |morse_character|
      decode_morse_character(morse_character)
    end
    return english_chars.join
  end

  def self.decode_morse_sentence(morse_sentence)
    morse_words = morse_sentence.split("/")
    english_words = morse_words.map do |morse_word|
      decode_morse_word(morse_word)
    end
    english_words.join(" ")
  end

end
