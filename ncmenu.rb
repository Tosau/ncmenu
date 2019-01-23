require 'bundler/setup'
require 'curses'

if Dir.exist?(Dir.home + '/.local/share/applications')
  then desktop_entries = Dir[Dir.home + '/.local/share/applications/*.desktop']
end
if Dir.exist?('/usr/local/share/applications')
  then desktop_entries << Dir['/usr/local/share/applications/*.destop']
end
if Dir.exist?('/usr/share/applications')
  then desktop_entries << Dir['/usr/share/applications/*.desktop']
end

desktop_entries.each do |entry|
  puts entry
end

exit 0
