root = File.absolute_path(File.dirname(__FILE__))

file_cache_path root
cookbook_path root + '/cookbooks'

ssl_verify_mode :verify_peer

file_cache_path root + '/chef/cache'
file_backup_path root + '/chef/backup'
role_path root + '/roles/'
data_bag_path root + '/data_bags/'
