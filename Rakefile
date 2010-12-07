desc "Generate the benchmarks yourself"
task :default do
  puts "Cleaning up previous run"
  system("rm -rf /tmp/distant.snakes")
  system("rm -rf /tmp/distant.ocicats")
  puts "Running puppet"
  Dir.chdir("./puppet") do
    system("./puppet --config puppet.conf site.pp")  
  end
  puppet_call_count = 0
  File.open("puppet-timing.prof", "r").each_line do |line|
    timing_data = line.split(/\s+/)
    puppet_call_count += timing_data[6].to_i if timing_data[6] =~ /\d+/
  end
  puts "Running chef"
  Dir.chdir("./chef") do
    system("./chef-solo -c chef-solo.rb")  
  end
  chef_call_count = 0
  File.open("chef-timing.prof", "r").each_line do |line|
    timing_data = line.split(/\s+/)
    chef_call_count += timing_data[6].to_i if timing_data[6] =~ /\d+/
  end
  puts "Puppet: #{puppet_call_count}"
  puts "Chef: #{chef_call_count}"
  puts "Number of calls chef wins by: #{puppet_call_count - chef_call_count}"
end
