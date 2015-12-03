#!/usr/bin/env ruby

# require 'pry'
require 'session'

#----------------------------------------------------------------------------
# Automatic update brew once a week with options
# gem install session
#
# puts RUBY_DESCRIPTION

FILE_NAME = '~/.brew-auto_update'
INTERVAL = 7
TODAY = Date.today

def give_help
  txts = []
  txts << '-' * 77
  txts << 'brew-auto_update allows the automatic update BREW every seven days'
  txts << "Last brew-auto_update: #{last_update}"
  txts << 'Options are:'
  txts << '  -f  --force    Force update'
  txts << '  -h  --help     Give help'
  txts << '  -s  --silence  Without question'
  txts << '-' * 77
  txts.each { |txt| puts txt }
end

def last_update
  file_name = File.expand_path(FILE_NAME)
  if File.exist?(file_name)
    File.open(file_name, 'r') do |file|
      line = file.gets
      return line.nil? ? nil : Date.parse(line)
    end
  else
    return nil
  end
end

def update?
  date_last_update = last_update
  return date_last_update ? last_update + INTERVAL < TODAY : true
end

def update!(force = false, silence = true)
  # prevent new update
  system "echo '#{TODAY}' > #{FILE_NAME}"

  stdin = 'brew update'
  sh = Session::new
  stdout, stderr = sh.execute stdin
  # puts "stdout/#{stdout}/ stderr/#{stderr}/"

  if force
    system 'brew upgrade --all'
  else
    stdin = 'brew outdated'
    stdout, stderr = sh.execute stdin
    # puts "stdout/#{stdout}/ stderr/#{stderr}/"
    puts stdout unless silence
    system 'brew upgrade --all' if stdout
  end
end


#############################################################################
### MAIN ###
############
silence, help, force = false, false, false

ARGV.each do |a|
  case a
  when '-f', '--force'
    force = true
  when '-h', '--help'
    help = true
    break
  when '-s', '--silence'
    silence = true
  end
end

if help
  give_help
else
  if force || update?
    if silence == false && force == false
      # Ask question : Do you want update brew ?
      puts '-' * 77
      puts 'Voulez-vous mettre à jour BREW ? [y/N]'
      yes = STDIN.gets.chomp
    end

    if force || yes.downcase[0] == 'y'
      update! force, silence
    end
  end
end
