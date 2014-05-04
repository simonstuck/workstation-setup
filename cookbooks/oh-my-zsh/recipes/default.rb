script "oh-my-zsh install from github" do 
  interpreter "bash"
  url = "https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh"
  code <<-EOS
    curl -sLf #{url} -o - | sh
  EOS
  not_if { File.directory? "#{ENV['HOME']}/.oh-my-zsh" }
end

directory "#{ENV['HOME']}/.oh-my-zsh/custom/themes/" do
  recursive true
end

template "#{ENV['HOME']}/.oh-my-zsh/custom/themes/simonstuck.zsh-theme" do
  source "simonstuck.zsh-theme.erb"
end

template "#{ENV['HOME']}/.zshrc" do
  source "dot.zshrc.erb"
  variables({ 
    :user => data_bag_item(:users, node[:user_config])
  })
end
