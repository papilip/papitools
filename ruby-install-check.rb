#!/usr/bin/env ruby
require 'session'

#----------------------------------------------------------------------------
# Test les dernières versions de ruby et vérifie si elle sont présentes sur ma machine
# fait le travail une fois ...
#
FILE_NAME = '~/.ruby-install-check'

today = Time.now.utc.strftime('%Y-%m-%d')
update_tf = false

file_name = File.expand_path(FILE_NAME)
if File.exist?(file_name)
  File.open(file_name, 'r') do |file|
    line = file.gets
    update_tf = true  unless line.chomp == today
  end
else
  update_tf = true
end

if update_tf
  # prevent new update
  # system "echo '#{today}' > #{FILE_NAME}"
  sh = Session::new

  # Liste les ruby installés sur notre système
  # stdin = 'chruby'
  # chruby, stderr = sh.execute stdin
  # puts chruby

  stdin = 'ruby-install'
  rubys, stderr = sh.execute stdin
  puts rubys

  # unless stdout.chomp == 'Already up-to-date.'
  #   stdin = 'brew outdated'
  #   stdout, stderr = sh.execute stdin
  #   # puts "stdout/#{stdout}/ stderr/#{stderr}/"
  #
  #   unless stdout == ''
  #     puts stdout
  #     puts '-' * 77
  #     puts 'Voulez-vous mettre à jour BREW ? [y/N]'
  #     yes = STDIN.gets.chomp
  #     if yes.upcase[0] == 'Y'
  #       stdin = 'brew upgrade'
  #       stdout, stderr = sh.execute stdin
  #       puts stdout
  #     end
  #   end
  # end
end
