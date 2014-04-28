directory "#{ENV['HOME']}/.vim/autoload" do
  mode 0755
  owner ENV['USER']
  group Etc.getgrgid(Process.gid).name
  recursive true
end

template "#{ENV['HOME']}/.vim/autoload/pathogen.vim" do
  mode 0755
  owner ENV['USER']
  group Etc.getgrgid(Process.gid).name
  source "autoload/pathogen.vim.erb"
end

directory "#{ENV['HOME']}/.vim/indent" do
  mode 0755
  owner ENV['USER']
  group Etc.getgrgid(Process.gid).name
  recursive true
end

template "#{ENV['HOME']}/.vim/indent/nc.vim" do
  mode 0755
  owner ENV['USER']
  group Etc.getgrgid(Process.gid).name
  source "indent/nc.vim.erb"
end

directory "#{ENV['HOME']}/.vim/syntax" do
  mode 0755
  owner ENV['USER']
  group Etc.getgrgid(Process.gid).name
  recursive true
end

template "#{ENV['HOME']}/.vim/syntax/nc.vim" do
  mode 0755
  owner ENV['USER']
  group Etc.getgrgid(Process.gid).name
  source "syntax/nc.vim.erb"
end

template "#{ENV['HOME']}/.vim/syntax/pig.vim" do
  mode 0755
  owner ENV['USER']
  group Etc.getgrgid(Process.gid).name
  source "syntax/pig.vim.erb"
end

directory "#{ENV['HOME']}/.vim/bundle" do
  mode 0755
  owner ENV['USER']
  group Etc.getgrgid(Process.gid).name
  recursive true
end

script "install ctrlp from Github" do
  interpreter "bash"
  url = "https://github.com/kien/ctrlp.vim.git"
  code <<-EOS
    git clone #{url} #{ENV['HOME']}/.vim/bundle/ctrlp.vim
  EOS
  not_if { File.directory? "#{ENV['HOME']}/.vim/bundle/ctrlp.vim" }
end

script "install funcoo from Github" do
  interpreter "bash"
  url = "https://github.com/rizzatti/funcoo.vim.git"
  code <<-EOS
    git clone #{url} #{ENV['HOME']}/.vim/bundle/funcoo.vim
  EOS
  not_if { File.directory? "#{ENV['HOME']}/.vim/bundle/funcoo.vim" }
end

script "install nerdtree from Github" do
  interpreter "bash"
  url = "https://github.com/scrooloose/nerdtree.git"
  code <<-EOS
    git clone #{url} #{ENV['HOME']}/.vim/bundle/nerdtree
  EOS
  not_if { File.directory? "#{ENV['HOME']}/.vim/bundle/nerdtree" }
end

script "install numbers from Github" do
  interpreter "bash"
  url = "https://github.com/myusuf3/numbers.vim.git"
  code <<-EOS
    git clone #{url} #{ENV['HOME']}/.vim/bundle/numbers
  EOS
  not_if { File.directory? "#{ENV['HOME']}/.vim/bundle/numbers" }
end

script "install fugitive from Github" do
  interpreter "bash"
  url = "https://github.com/tpope/vim-fugitive.git"
  code <<-EOS
    git clone #{url} #{ENV['HOME']}/.vim/bundle/vim-fugitive
  EOS
  not_if { File.directory? "#{ENV['HOME']}/.vim/bundle/vim-fugitive" }
end

script "install vim-gitgutter from Github" do
  interpreter "bash"
  url = "https://github.com/airblade/vim-gitgutter.git"
  code <<-EOS
    git clone #{url} #{ENV['HOME']}/.vim/bundle/vim-gitgutter
  EOS
  not_if { File.directory? "#{ENV['HOME']}/.vim/bundle/vim-gitgutter" }
end

script "install vim-sensible from Github" do
  interpreter "bash"
  url = "https://github.com/tpope/vim-sensible.git"
  code <<-EOS
    git clone #{url} #{ENV['HOME']}/.vim/bundle/vim-sensible
  EOS
  not_if { File.directory? "#{ENV['HOME']}/.vim/bundle/vim-sensible" }
end

template "#{ENV['HOME']}/.vimrc" do
  mode 0755
  owner ENV['USER']
  group Etc.getgrgid(Process.gid).name
  source "dot.vimrc.erb"
end
