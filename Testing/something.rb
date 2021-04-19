def timer
  # your implementation
  raise RuntimeError.new "no block given" unless block_given?
  before = Time.now
  10000000.times {|x| yield x }
  after = Time.now
  time_spent = after - before
  puts "#{time_spent} seconds"
end

timer { |x| i = x.to_s } # 2.361257 seconds

timer # No block given (RuntimeError)