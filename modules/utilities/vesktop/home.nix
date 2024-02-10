{ pkgs, ... }:

{
  home.packages = with pkgs; [ vesktop ];

  xdg.configFile."vesktop/settings/settings.json" = {
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
                  "enabled": false
              },
              "MessageAccessoriesAPI": {
                  "enabled": true
              },
              "MessageDecorationsAPI": {
                  "enabled": false
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
                  "enabled": false
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
              "BetterGifPicker": {
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
                  "enabled": false
              },
              "Dearrow": {
                  "enabled": false
              },
              "Decor": {
                  "enabled": false
              },
              "DisableDMCallIdle": {
                  "enabled": false
              },
              "EmoteCloner": {
                  "enabled": true
              },
              "Experiments": {
                  "enabled": false
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
                  "transformCompoundSentence": false
              },
              "FakeProfileThemes": {
                  "enabled": false
              },
              "FavoriteEmojiFirst": {
                  "enabled": false
              },
              "FavoriteGifSearch": {
                  "enabled": false
              },
              "FixCodeblockGap": {
                  "enabled": false
              },
              "FixSpotifyEmbeds": {
                  "enabled": true,
                  "volume": 5.017605633802817
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
                  "enabled": false
              },
              "InvisibleChat": {
                  "enabled": false
              },
              "KeepCurrentChannel": {
                  "enabled": false
              },
              "LastFMRichPresence": {
                  "enabled": false
              },
              "LoadingQuotes": {
                  "enabled": false
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
                  "enabled": false
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
                  "enabled": false,
                  "tagSettings": {
                      "WEBHOOK": {
                          "text": "Webhook",
                          "showInChat": true,
                          "showInNotChat": true
                      },
                      "OWNER": {
                          "text": "Owner",
                          "showInChat": true,
                          "showInNotChat": true
                      },
                      "ADMINISTRATOR": {
                          "text": "Admin",
                          "showInChat": true,
                          "showInNotChat": true
                      },
                      "MODERATOR_STAFF": {
                          "text": "Staff",
                          "showInChat": true,
                          "showInNotChat": true
                      },
                      "MODERATOR": {
                          "text": "Mod",
                          "showInChat": true,
                          "showInNotChat": true
                      },
                      "VOICE_MODERATOR": {
                          "text": "VC Mod",
                          "showInChat": true,
                          "showInNotChat": true
                      }
                  }
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
              "NotificationVolume": {
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
                  "enabled": false
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
                  "enabled": false
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
                  "enabled": true
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
              "ReviewDB": {
                  "enabled": false
              },
              "RoleColorEverywhere": {
                  "enabled": true,
                  "chatMentions": true,
                  "memberList": true,
                  "voiceUsers": true
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
                  "enabled": false
              },
              "SpotifyCrack": {
                  "enabled": false
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
                  "enabled": true,
                  "autoTranslate": false
              },
              "TypingIndicator": {
                  "enabled": false
              },
              "TypingTweaks": {
                  "enabled": true,
                  "alternativeFormatting": true
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
                  "enabled": false
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
                  "enabled": true
              },
              "Wikisearch": {
                  "enabled": false
              },
              "XSOverlay": {
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
              "settingsSyncVersion": 1707589142019
          }
      }
    '';
  };
}
