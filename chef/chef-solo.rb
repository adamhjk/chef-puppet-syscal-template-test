log_level :info
log_location STDOUT
checksum_cache_path "/tmp/chef-bench-cache"
file_cache_path File.expand_path(File.dirname(__FILE__))
cookbook_path File.expand_path(File.join(File.dirname(__FILE__), "cookbooks"))

