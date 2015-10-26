#!/usr/bin/env ruby

# update all repository in a directory
# take in parameter a directory list or take the current directory

def gitfetch(depot, i)
  puts "#{'=' * 2}#{' ' if i < 100}#{' ' if i < 10}#{i}#{'=' * 2} #{depot} #{'=' * (70 - depot.length)}"
  # puts '=' * 77
  cmd = "git --git-dir=#{depot}/.git --work-tree=#{depot}"
  # puts cmd

  # Take the current branch
  symbolic_ref = `#{cmd} symbolic-ref HEAD`
  symbolic_ref.delete! "\n"
  branch = symbolic_ref.split('/').last
  # puts branch

  # Change branch to master if we do
  `#{cmd} checkout master`              unless branch == 'master'

  # git pull
  # puts `cd #{depot} ; pwd`
  `cd #{depot} ; git fetch origin`

  # Checkout the branch if we do
  `#{cmd} checkout #{branch}`           unless branch == 'master'
end


def give_depots(dossier = '.')
  i = 0
  tb_files = Dir["#{dossier}/*"]
  tb_files.each do |file|
    # Is a directory ?
    if File.directory?(file)
      # Is a repository ?
      if File.directory?("#{file}/.git")
        # Yes ! => git pull
        gitfetch(file, i += 1)
      end
    end
  end
end


############################################################################
### MAIN
if ARGV.length > 0
  ARGV.each { |value| give_depots(value) }
else
  give_depots
end
