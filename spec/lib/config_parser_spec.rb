require 'spec_helper'
require 'byebug'

require_relative '../../bin/config_parser/config_parser'

describe 'parse information from data.txt' do
  it 'should parse the data from file' do
    expected_result = {
      'host' => 'test.com',
      'server_id' => 55331,
      'cost' => 2.56,
      'user' => 'user',
      'verbose' => true,
      'test_mode' => true,
      'debug_mode' => false,
      'log_file_path' => '/tmp/logfile.log',
      'send_notifications' => true
    }

    expect(parse_data_file).to eq(expected_result)
  end
end