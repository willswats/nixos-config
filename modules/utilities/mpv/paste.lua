local mp = require "mp"

local opts = {
  -- Key used for pasting
  key_paste = "Ctrl+v",

  -- Key used for pasting into playlist
  key_paste_into_playlist = "Ctrl+Shift+v",

  -- Duration of osd messages
  osd_message_duration = 5
}

local clipboard = mp.command_native {
  name = "subprocess",
  playback_only = false,
  args = { "wl-paste", "--no-newline" },
  capture_stdout = true
}.stdout

local function paste()
  mp.commandv("loadfile", clipboard)
  mp.osd_message("Pasted", opts.osd_message_duration)
end

local function paste_into_playlist()
  mp.commandv("loadfile", clipboard, "append-play")
  mp.osd_message("Pasted into playlist", opts.osd_message_duration)
end

mp.add_key_binding(opts.key_paste, "paste", paste)
mp.add_key_binding(opts.key_paste_into_playlist, "paste_into_playlist", paste_into_playlist)
