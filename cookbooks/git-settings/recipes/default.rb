template "#{ENV['HOME']}/.gitignore_global" do
  mode 0755
  owner ENV['USER']
  group Etc.getgrgid(Process.gid).name
  source "dot.gitignore_global.erb"
end

template "#{ENV['HOME']}/.gitconfig" do
  mode 0755
  owner ENV['USER']
  group Etc.getgrgid(Process.gid).name
  source "dot.gitconfig.erb"
  variables({ 
    :home => ENV['HOME'], 
    :user => data_bag_item(:users, node[:user_config])
  })
end
