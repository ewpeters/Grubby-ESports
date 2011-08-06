FollowGrubby
========
Prerequisites
----------------------------
Ruby Gems 1.5.3
[http://rubyforge.org/frs/download.php/74343/rubygems-1.5.3.tgz](http://rubyforge.org/frs/download.php/74343/rubygems-1.5.3.tgz)
Untar, compile and install

Rails 2.3.8
`sudo gem install rails -v=2.3.8`

Image Magick
1. To install this I recommend homebrew (mac ports works too I guess) [http://mxcl.github.com/homebrew/](http://mxcl.github.com/homebrew/)
2. After installing homebrew run `brew install imagemagick`

LocalMySQL server
[http://dev.mysql.com/doc/refman/5.0/en/macosx-installation.html](http://dev.mysql.com/doc/refman/5.0/en/macosx-installation.html)

Install Process (for nubs)
----------------------------
1. `rake gems:install`
2. `rake db:create`
3. `rake db:migrate`
4. `./script/server`
5. [http://0.0.0.0:3000](http://0.0.0.0:3000)


