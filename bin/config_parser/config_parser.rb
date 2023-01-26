def parse_data_file
  expected_result = {}
  file_open = File.open("#{Dir.pwd}/bin/config_parser/data.txt", 'r')
  File.foreach(file_open) do |line|
    next if line.start_with?("#")
    key, value = line.strip.split("=")
    next unless key && value
    expected_result[key.strip] = parse_value(value.strip)
  end

  expected_result
end

def parse_value(value)
  case value
  when "true" then true
  when "yes" then true
  when "on" then true
  when "false" then false
  when "no" then false
  when "off" then false
  when /\A\d+\z/ then value.to_i
  when /\A\d*\.\d+\z/ then value.to_f
  else value
  end
end
