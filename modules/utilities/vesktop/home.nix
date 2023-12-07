{ pkgs, ... }:

{
  home.packages = with pkgs; [ vesktop ];

  xdg.configFile."VencordDesktop/VencordDesktop/settings/settings.json" = {
    text = ''
      {
          "notifyAboutUpdates": true,
          "autoUpdate": false,
          "autoUpdateNotification": true,
          "useQuickCss": true,
          "themeLinks": [],
          "enabledThemes": [],
          "enableReactDevtools": false,
          "frameless": false,
          "transparent": false,
          "winCtrlQ": false,
          "macosTranslucency": false,
          "disableMinSize": false,
          "winNativeTitleBar": false,
          "plugins": {
              "BadgeAPI": {
                  "enabled": true
              },
              "CommandsAPI": {
                  "enabled": true
              },
              "ContextMenuAPI": {
                  "enabled": true
              },
              "MemberListDecoratorsAPI": {
                  "enabled": true
              },
              "MessageAccessoriesAPI": {
                  "enabled": true
              },
              "MessageDecorationsAPI": {
                  "enabled": true
              },
              "MessageEventsAPI": {
                  "enabled": true
              },
              "MessagePopoverAPI": {
                  "enabled": true
              },
              "NoticesAPI": {
                  "enabled": true
              },
              "ServerListAPI": {
                  "enabled": true
              },
              "NoTrack": {
                  "enabled": true
              },
              "Settings": {
                  "enabled": true,
                  "settingsLocation": "aboveActivity"
              },
              "SupportHelper": {
                  "enabled": true
              },
              "AlwaysAnimate": {
                  "enabled": false
              },
              "AlwaysTrust": {
                  "enabled": false
              },
              "AnonymiseFileNames": {
                  "enabled": false,
                  "method": 0,
                  "randomisedLength": 7,
                  "consistent": "image"
              },
              "WebRichPresence (arRPC)": {
                  "enabled": false
              },
              "BANger": {
                  "enabled": false
              },
              "BetterFolders": {
                  "enabled": false
              },
              "BetterGifAltText": {
                  "enabled": false
              },
              "BetterNotesBox": {
                  "enabled": false
              },
              "BetterRoleDot": {
                  "enabled": false
              },
              "BetterUploadButton": {
                  "enabled": false
              },
              "BiggerStreamPreview": {
                  "enabled": false
              },
              "BlurNSFW": {
                  "enabled": false
              },
              "CallTimer": {
                  "enabled": false
              },
              "ClearURLs": {
                  "enabled": false
              },
              "ClientTheme": {
                  "enabled": true,
                  "color": "1e1e2e"
              },
              "ColorSighted": {
                  "enabled": false
              },
              "ConsoleShortcuts": {
                  "enabled": false
              },
              "CopyUserURLs": {
                  "enabled": false
              },
              "CrashHandler": {
                  "enabled": true
              },
              "CustomRPC": {
                  "enabled": false,
                  "type": 0,
                  "timestampMode": 0
              },
              "Dearrow": {
                  "enabled": false
              },
              "DisableDMCallIdle": {
                  "enabled": false
              },
              "EmoteCloner": {
                  "enabled": true
              },
              "Experiments": {
                  "enabled": false,
                  "enableIsStaff": false
              },
              "F8Break": {
                  "enabled": false
              },
              "FakeNitro": {
                  "enabled": true,
                  "enableEmojiBypass": true,
                  "enableStickerBypass": true,
                  "enableStreamQualityBypass": true,
                  "transformStickers": true,
                  "transformEmojis": true,
                  "transformCompoundSentence": false,
                  "emojiSize": 48,
                  "stickerSize": 160
              },
              "FakeProfileThemes": {
                  "enabled": false,
                  "nitroFirst": true
              },
              "FavoriteEmojiFirst": {
                  "enabled": false
              },
              "FavoriteGifSearch": {
                  "enabled": false
              },
              "FixImagesQuality": {
                  "enabled": false
              },
              "FixSpotifyEmbeds": {
                  "enabled": false,
                  "volume": 5.28169014084507
              },
              "ForceOwnerCrown": {
                  "enabled": false
              },
              "FriendInvites": {
                  "enabled": false
              },
              "GameActivityToggle": {
                  "enabled": false
              },
              "GifPaste": {
                  "enabled": false
              },
              "GreetStickerPicker": {
                  "enabled": false
              },
              "HideAttachments": {
                  "enabled": false
              },
              "iLoveSpam": {
                  "enabled": false
              },
              "IgnoreActivities": {
                  "enabled": false
              },
              "ImageZoom": {
                  "enabled": false,
                  "saveZoomValues": true,
                  "invertScroll": true,
                  "nearestNeighbour": false,
                  "square": false,
                  "zoom": 5.799999999999999,
                  "size": 100,
                  "zoomSpeed": 0.5
              },
              "InvisibleChat": {
                  "enabled": false,
                  "savedPasswords": "password, Password"
              },
              "KeepCurrentChannel": {
                  "enabled": false
              },
              "LastFMRichPresence": {
                  "enabled": false
              },
              "LoadingQuotes": {
                  "enabled": false,
                  "replaceEvents": true
              },
              "MemberCount": {
                  "enabled": true
              },
              "MessageClickActions": {
                  "enabled": false
              },
              "MessageLinkEmbeds": {
                  "enabled": false
              },
              "MessageLogger": {
                  "enabled": false,
                  "deleteStyle": "text",
                  "ignoreBots": false,
                  "ignoreSelf": false,
                  "ignoreUsers": "",
                  "ignoreChannels": "",
                  "ignoreGuilds": ""
              },
              "MessageTags": {
                  "enabled": false
              },
              "MoreCommands": {
                  "enabled": false
              },
              "MoreKaomoji": {
                  "enabled": false
              },
              "MoreUserTags": {
                  "enabled": false
              },
              "Moyai": {
                  "enabled": false
              },
              "MuteNewGuild": {
                  "enabled": false
              },
              "MutualGroupDMs": {
                  "enabled": false
              },
              "NoBlockedMessages": {
                  "enabled": false
              },
              "NoDevtoolsWarning": {
                  "enabled": false
              },
              "NoF1": {
                  "enabled": false
              },
              "NoMosaic": {
                  "enabled": false
              },
              "NoPendingCount": {
                  "enabled": false
              },
              "NoProfileThemes": {
                  "enabled": false
              },
              "NoReplyMention": {
                  "enabled": false
              },
              "NoScreensharePreview": {
                  "enabled": false
              },
              "NoTypingAnimation": {
                  "enabled": false
              },
              "NoUnblockToJump": {
                  "enabled": false
              },
              "NormalizeMessageLinks": {
                  "enabled": false
              },
              "NSFWGateBypass": {
                  "enabled": false
              },
              "OnePingPerDM": {
                  "enabled": false
              },
              "oneko": {
                  "enabled": false
              },
              "OpenInApp": {
                  "enabled": false
              },
              "Party mode 🎉": {
                  "enabled": false
              },
              "PermissionFreeWill": {
                  "enabled": false,
                  "lockout": true,
                  "onboarding": true
              },
              "PermissionsViewer": {
                  "enabled": false
              },
              "petpet": {
                  "enabled": false
              },
              "PictureInPicture": {
                  "enabled": false
              },
              "PinDMs": {
                  "enabled": false
              },
              "PlainFolderIcon": {
                  "enabled": false
              },
              "PlatformIndicators": {
                  "enabled": false,
                  "list": true,
                  "badges": true,
                  "messages": true,
                  "colorMobileIndicator": true
              },
              "PreviewMessage": {
                  "enabled": true
              },
              "PronounDB": {
                  "enabled": false
              },
              "QuickMention": {
                  "enabled": false
              },
              "QuickReply": {
                  "enabled": false
              },
              "ReactErrorDecoder": {
                  "enabled": false
              },
              "ReadAllNotificationsButton": {
                  "enabled": false
              },
              "RelationshipNotifier": {
                  "enabled": false
              },
              "RevealAllSpoilers": {
                  "enabled": false
              },
              "ReverseImageSearch": {
                  "enabled": false
              },
              "RoleColorEverywhere": {
                  "enabled": false
              },
              "SearchReply": {
                  "enabled": false
              },
              "SecretRingToneEnabler": {
                  "enabled": false
              },
              "SendTimestamps": {
                  "enabled": false
              },
              "ServerListIndicators": {
                  "enabled": false
              },
              "ServerProfile": {
                  "enabled": true
              },
              "ShikiCodeblocks": {
                  "enabled": true,
                  "useDevIcon": "GREYSCALE",
                  "theme": "https://raw.githubusercontent.com/shikijs/shiki/0b28ad8ccfbf2615f2d9d38ea8255416b8ac3043/packages/shiki/themes/dark-plus.json"
              },
              "ShowAllMessageButtons": {
                  "enabled": false
              },
              "ShowConnections": {
                  "enabled": false
              },
              "ShowHiddenChannels": {
                  "enabled": false
              },
              "ShowMeYourName": {
                  "enabled": false
              },
              "ShowTimeouts": {
                  "enabled": false
              },
              "SilentMessageToggle": {
                  "enabled": false
              },
              "SilentTyping": {
                  "enabled": true,
                  "showIcon": false,
                  "isEnabled": true
              },
              "SortFriendRequests": {
                  "enabled": false
              },
              "SpotifyControls": {
                  "enabled": false,
                  "hoverControls": false
              },
              "SpotifyCrack": {
                  "enabled": false,
                  "noSpotifyAutoPause": true,
                  "keepSpotifyActivityOnIdle": false
              },
              "SpotifyShareCommands": {
                  "enabled": false
              },
              "StartupTimings": {
                  "enabled": false
              },
              "SuperReactionTweaks": {
                  "enabled": false
              },
              "TextReplace": {
                  "enabled": false
              },
              "ThemeAttributes": {
                  "enabled": false
              },
              "TimeBarAllActivities": {
                  "enabled": false
              },
              "Translate": {
                  "enabled": false,
                  "autoTranslate": false,
                  "receivedInput": "auto",
                  "receivedOutput": "en"
              },
              "TypingIndicator": {
                  "enabled": false
              },
              "TypingTweaks": {
                  "enabled": false
              },
              "Unindent": {
                  "enabled": false
              },
              "UnsuppressEmbeds": {
                  "enabled": false
              },
              "UrbanDictionary": {
                  "enabled": false
              },
              "UserVoiceShow": {
                  "enabled": false
              },
              "USRBG": {
                  "enabled": false,
                  "voiceBackground": true,
                  "nitroFirst": true
              },
              "ValidUser": {
                  "enabled": false
              },
              "VoiceChatDoubleClick": {
                  "enabled": false
              },
              "VcNarrator": {
                  "enabled": false
              },
              "VencordToolbox": {
                  "enabled": false
              },
              "ViewIcons": {
                  "enabled": false
              },
              "ViewRaw": {
                  "enabled": false
              },
              "VoiceMessages": {
                  "enabled": false
              },
              "WebContextMenus": {
                  "enabled": true,
                  "addBack": true
              },
              "WebKeybinds": {
                  "enabled": true
              },
              "WhoReacted": {
                  "enabled": false
              },
              "Wikisearch": {
                  "enabled": false
              }
          },
          "notifications": {
              "timeout": 5000,
              "position": "bottom-right",
              "useNative": "not-focused",
              "logLimit": 50
          },
          "cloud": {
              "authenticated": false,
              "url": "https://api.vencord.dev/",
              "settingsSync": false,
              "settingsSyncVersion": 1701991401678
          }
      }
    '';
  };
}
