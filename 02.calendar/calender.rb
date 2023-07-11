require "optparse"
require "date"

FIRST_DAY_OF_MONTH = 1
LAST_DAY_OF_MONTH = -1

def main
  options = parse_options

  month = options[:month] || Date.today.month
  year = options[:year] || Date.today.year

  print_calendar(month, year)
end

def parse_options
  options = {
    month: nil,
    year: nil,
  }

  OptionParser.new do |opts|
    opts.banner = "Usage: calendar.rb [options]"

    opts.on("-m", "--month MONTH", "Specify the month") do |month|
      options[:month] = month.to_i
    end

    opts.on("-y", "--year YEAR", "Specify the year") do |year|
      options[:year] = year.to_i
    end

    opts.on("-h", "--help", "Display help") do
      puts opts
      exit
    end
  end.parse!

  options
end

def print_calendar(month, year)
  day_of_the_week = Date.new(year, month, FIRST_DAY_OF_MONTH).cwday
  days_of_month = Date.new(year, month, LAST_DAY_OF_MONTH).day
  
  puts "      #{month}月 #{year}    "
  puts " 日 月 火 水 木 金 土"

  print "   " * day_of_the_week

  (1..days_of_month).each do |day|
    print "%3d" % day
    puts if (day + day_of_the_week) % 7 == 0
  end

  puts
end

main
