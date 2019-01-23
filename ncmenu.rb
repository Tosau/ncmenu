require 'bundler/setup'
require 'curses'
require 'xdg'

def update_list
  desktop_entries = XDG['DATA'].select('/applications/*.desktop')
  applications = []

  puts 'Found these files:'
  desktop_entries.each do |entry|
    puts entry

    next unless File.foreach(entry).grep(/(Type=Application)/).any?

    applications << Application.new(
      File.foreach(entry).grep(/(?<=Name\[\]=")(.*?(?="))/),
      File.foreach(entry).grep(/(?<=Exec=).*/)
    )
  end
end

exit 0
