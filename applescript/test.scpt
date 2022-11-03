on run argv

tell application "Inkscape"
    activate
end tell

tell application "System Events"
  delay 1 
  keystroke item 1 of argv
end tell

delay 2
end run
