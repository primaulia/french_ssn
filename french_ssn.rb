require 'date'
require 'yaml'

def french_ssn_info(ssn)
  pattern = /(?<gender>[1|2])\s?(?<yob>\d{2})\s?(?<mob>\d{2})\s?(?<dept>\d{2})\s?\d{3}\s?\d{3}\s?\d{2}/

  return "The number is invalid" if ssn == ""

  # decompose the string via regex DONE
  # use regex method match to pull each info out
  match_data = ssn.match(pattern)

  # check gender
  if match_data[:gender] == "1"
    gender = "man"
  else
    gender = "woman"
  end

  # check yob
  yob = "19#{match_data[:yob]}"

  # check mob
  # need to use Date::MONTHNAMES
  mob = Date::MONTHNAMES[match_data[:mob].to_i]
  
  # department code
  dept = YAML.load_file('data/french_departments.yml')[match_data[:dept]]
  # puts dept  
  # p YAML.load_file('data/french_departments.yml')

  puts "a #{gender}, born in #{mob}, #{yob} in #{dept}."
end