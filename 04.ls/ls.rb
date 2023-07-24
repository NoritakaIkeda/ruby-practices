# frozen_string_literal: true

def path
  '.'
end

def all_dir_or_file(dir_path)
  all_items = []
  Dir.foreach(dir_path) do |item|
    next if item == '.' || item == '..' || item.start_with?('.')

    all_items << item
  end
  all_items
end

def display(all_items)
  max_columns = 3
  max_rows = (all_items.size.to_f / max_columns).ceil
  max_rows.times do |row|
    max_columns.times do |col|
      index = row + col * max_rows
      print "#{all_items[index]} \t" if all_items[index]
    end
    puts
  end
end

display(all_dir_or_file(path))
