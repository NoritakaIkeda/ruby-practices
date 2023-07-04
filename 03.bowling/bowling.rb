# frozen_string_literal: true

SHOTS_PER_FRAME_NORMAL = 2

score = ARGV[0]
scores = score.split(',')
shots = []
scores.each do |s|
  if shots.length >= 18 && s == 'X'
    shots << 10
  elsif s == 'X'
    shots << 10
    shots << 0
  else
    shots << s.to_i
  end
end

shots_half = []
shots.each_slice(SHOTS_PER_FRAME_NORMAL * 9) do |s|
  shots_half << s
end

frames = []
shots_half[0].each_slice(2) do |s|
  frames << s
end

frames << shots_half[1]
point = 0
frames.each_with_index do |frame, index|
  should_conpute_strike = frame[0] == 10 && (index < 9)
  should_conpute_spare = frame.sum == 10 && (index < 9)
  point += if should_conpute_strike
             is_double = frames[index + 1][0] == 10 && (index < 8)
             is_9th_frame = index == 8
             if is_double
               frame[0] + frames[index + 1][0] + frames[index + 2][0]
             elsif is_9th_frame
               frame[0] + frames[index + 1][0] + frames[index + 1][1]
             else
               frame[0] + frames[index + 1].sum
             end
           elsif should_conpute_spare
             frame.sum + frames[index + 1][0]
           else
             frame.sum
           end
end
puts point
