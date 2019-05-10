require 'yaml'

def load_library(file_path)
  emoticons = YAML.load_file('./lib/emoticons.yml')
  emoticon_hash = Hash.new

  emoticon_hash["get_emoticon"] = Hash.new
  emoticon_hash["get_meaning"] = Hash.new

  emoticons.each do |english_word, emoticon_set|
  	emoticon_hash["get_emoticon"][emoticon_set.first] = emoticon_set.last
  	emoticon_hash["get_meaning"][emoticon_set.last] = english_word
  end
  emoticon_hash
end

def get_japanese_emoticon(file_path, emoticon)
	emoticon_hash = load_library(file_path)
	answer = emoticon_hash["get_emoticon"][emoticon]
	if answer == nil
		answer = "Sorry, that emoticon was not found"
	end
	answer
end

def get_english_meaning(file_path, emoticon)
	emoticon_hash = load_library(file_path)
	answer = emoticon_hash["get_meaning"][emoticon]
	if answer == nil
		answer = "Sorry, that emoticon was not found"
	end
	answer
end