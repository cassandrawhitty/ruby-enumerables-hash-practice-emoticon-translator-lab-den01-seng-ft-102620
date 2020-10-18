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
  names_and_emojis.values.each do |emoji| 
    binding.pry
  end
  # if names_and_emojis.values.include? (emoticon) 
    # return response.values[0][:japanese]
  # else
    # return "Sorry, that emoticon was not found"
  # end
end

def get_english_meaning(file_name, emoticon)
  names_and_emojis = load_library(file_name)

  # binding.pry
  names_and_emojis.each do |names, languages_and_emojis|
    if languages_and_emojis[:japanese] == emoticon
      # binding.pry
      return names
    end
  end
  return "Sorry, that emoticon was not found"
end