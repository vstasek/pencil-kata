def calculate_pay arrival_time, departure_time, bed_time
  if bed_time > departure_time
    (departure_time - arrival_time) * 12
  elsif arrival_time <= 5 
    16
  else
    (departure_time - bed_time) * 8
  end
end