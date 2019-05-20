# require modules here

def load_library(path)
  # code goes here
  require "yaml"
  emoticons = YAML.load_file(path)
  emoticon_hash = {}
  emoticon_hash["get_meaning"] = {} # Japanese emoticons
  emoticon_hash["get_emoticon"] = {} # Western emoticons

  emoticons.each do |word, emoticon|
    emoticon_hash["get_emoticon"][emoticon[0]] = emoticon[1]
    emoticon_hash["get_meaning"][emoticon[1]] = word
    # binding.pry
  end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_emoticon"][emoticon]
  sorry_message = "Sorry, that emoticon was not found"
  result.nil? ? sorry_message : result
end

def get_english_meaning(path, emoticon)
  # code goes here
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_meaning"][emoticon]
  sorry_message = "Sorry, that emoticon was not found"
  result.nil? ? sorry_message : result
end
