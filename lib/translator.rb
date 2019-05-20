require 'yaml'

def load_library(file_path)
 emoticons=YAML.load_file('./lib/emoticons.yml')
 emoticons_hash=Hash.new 
 
 emoticons_hash["get_emoticon"]=Hash.new 
 emoticons_hash["get_meaning"]=Hash.new 
 
 emoticons.each do |word,faces| 
 emoticons_hash["get_emoticon"][faces.first]=faces.last 
emoticons_hash["get_meaning"][faces.last]= word 
 end 
 emoticons_hash
end

def get_japanese_emoticon(file_path,emoticon)
 emoticons_hash = load_library(file_path)
 answer = emoticons_hash["get_emoticon"][emoticon]
	if answer == nil
		answer = "Sorry, that emoticon was not found"
	end
	answer
end	


def get_english_meaning(file_path,emoticon)
 emoticons_hash = load_library(file_path)
answer = emoticons_hash["get_meaning"][emoticon]
	if answer == nil
		answer = "Sorry, that emoticon was not found"
	end
	answer
end	