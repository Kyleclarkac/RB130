
def step(start, finish, stepper)
  num = start
  while num <= finish
    yield num
    num += stepper
  end 
end 

step(1, 10, 3) { |value| puts "value = #{value}" }
