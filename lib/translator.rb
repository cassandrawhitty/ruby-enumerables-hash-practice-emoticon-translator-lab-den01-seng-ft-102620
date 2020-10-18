require "yaml"
require "pry" 

def load_library(file_name)
  library = YAML.load_file(file_name)
  response = {}
  library.each do |words, emojis|
    response[words] = {:english => emojis[0], :japanese => emojis[1]}
  end
  response
end


def get_japanese_emoticon(file_name, emoticon)
  names_and_emojis = load_library(file_name)
  names_and_emojis.each do |emoji| 
    if languages_and_emojis[:english] == emoticon
       binding.pry
      return languages_and_emojis[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_name, emoticon)
  names_and_emojis = load_library(file_name)
  names_and_emojis.each do |names, languages_and_emojis|
    if languages_and_emojis[:japanese] == emoticon
      return names
    end
  end
  return "Sorry, that emoticon was not found"
end