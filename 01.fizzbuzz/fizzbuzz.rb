def fizzbuzz(number)
  if (number % 15) == 0
    "FizzBuzz"
  elsif(number % 3) == 0
    "Fizz"
  elsif (number % 5) == 0
    "Buzz"
  else
    number
  end
end

1.upto 20 do |i|
  puts fizzbuzz(i)
end
