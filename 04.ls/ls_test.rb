# frozen_string_literal: true

require 'minitest/autorun'
require './ls'

class SampleTest < Minitest::Test
  def setup
    $stdout = StringIO.new
  end

  def teardown
    $stdout = STDOUT
  end

  def test_path
    carrent_dir_path = path
    assert_equal '.', carrent_dir_path
  end

  def test_all_dir_or_file
    all_dir_or_file = all_dir_or_file('.')
    assert_equal ['ls.rb', 'ls_test.rb'], all_dir_or_file
  end

  def test_display_three_columns
    items = %w[File1 File2 File3 File4 File5 File6 File7]
    display(items)
    expected_output = "File1 \tFile4 \tFile7 \t\nFile2 \tFile5 \t\nFile3 \tFile6 \t\n"
    assert_equal expected_output, $stdout.string
  end

  def test_display_less_than_three_items
    items = %w[File1 File2]
    display(items)
    expected_output = "File1 \tFile2 \t\n"
    assert_equal expected_output, $stdout.string
  end

  def test_display_less_than_max_columns
    items = %w[File1 File2 File3 File4]
    display(items)
    expected_output = "File1 \tFile3 \t\nFile2 \tFile4 \t\n"
    assert_equal expected_output, $stdout.string
  end
end
