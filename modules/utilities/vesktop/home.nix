{ pkgs, ... }:

{
  home.packages = with pkgs; [ vesktop ];

  xdg.configFile."vesktop/settings.json" = {
    text = ''
      {
        "tray": false,
        "minimizeToTray": false,
        "checkUpdates": false,
        "appBadge": false,
        "arRPC": true,
        "splashColor": "oklab(0.899401 -0.00192499 -0.00481987)",
        "splashBackground": "oklab(0.242856 0.00730695 -0.0294512)",
        "splashTheming": true
      }
    '';
  };

  xdg.configFile."vesktop/settings/settings.json" = {
    text = ''
      {
        "autoUpdate": false,
        "autoUpdateNotification": false,
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
          "ChatInputButtonAPI": {
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
            "enabled": false
          },
          "NoTrack": {
            "enabled": true,
            "disableAnalytics": true
          },
          "Settings": {
            "enabled": true,
            "settingsLocation": "aboveNitro"
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
          "AutomodContext": {
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
          "BetterRoleContext": {
            "enabled": false
          },
          "BetterRoleDot": {
            "enabled": false
          },
          "BetterSessions": {
            "enabled": false
          },
          "BetterSettings": {
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
          "CtrlEnterSend": {
            "enabled": false
          },
          "CustomRPC": {
            "enabled": false
          },
          "CustomIdle": {
            "enabled": false
          },
          "Dearrow": {
            "enabled": false
          },
          "Decor": {
            "enabled": false
          },
          "DisableCallIdle": {
            "enabled": true
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
            "emojiSize": 48,
            "transformEmojis": true,
            "enableStickerBypass": true,
            "stickerSize": 160,
            "transformStickers": true,
            "transformCompoundSentence": false,
            "enableStreamQualityBypass": true,
            "useHyperLinks": true,
            "hyperLinkText": "{{NAME}}",
            "disableEmbedPermissionCheck": false
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
          "FixYoutubeEmbeds": {
            "enabled": false
          },
          "ForceOwnerCrown": {
            "enabled": true
          },
          "FriendInvites": {
            "enabled": false
          },
          "FriendsSince": {
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
          "ImageLink": {
            "enabled": false
          },
          "ImageZoom": {
            "enabled": false
          },
          "ImplicitRelationships": {
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
            "enabled": true,
            "memberList": true,
            "toolTip": true
          },
          "MessageClickActions": {
            "enabled": false
          },
          "MessageLatency": {
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
            "enabled": false
          },
          "Moyai": {
            "enabled": false
          },
          "MutualGroupDMs": {
            "enabled": false
          },
          "NewGuildSettings": {
            "enabled": false
          },
          "NoBlockedMessages": {
            "enabled": false
          },
          "NoDefaultHangStatus": {
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
          "NoServerEmojis": {
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
          "OverrideForumDefaults": {
            "enabled": false
          },
          "PartyMode": {
            "enabled": false
          },
          "PauseInvitesForever": {
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
            "enabled": false
          },
          "RelationshipNotifier": {
            "enabled": false
          },
          "ReplaceGoogleSearch": {
            "enabled": false
          },
          "ReplyTimestamp": {
            "enabled": false
          },
          "ResurrectHome": {
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
          "ShikiCodeblocks": {
            "enabled": true,
            "theme": "https://raw.githubusercontent.com/shikijs/shiki/0b28ad8ccfbf2615f2d9d38ea8255416b8ac3043/packages/shiki/themes/rose-pine.json",
            "tryHljs": "SECONDARY",
            "useDevIcon": "GREYSCALE",
            "bgOpacity": 100
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
          "ShowHiddenThings": {
            "enabled": false
          },
          "ShowMeYourName": {
            "enabled": false
          },
          "ShowTimeoutDuration": {
            "enabled": false
          },
          "SilentMessageToggle": {
            "enabled": false
          },
          "SilentTyping": {
            "enabled": true,
            "isEnabled": true,
            "showIcon": false
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
          "StreamerModeOnStream": {
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
            "autoTranslate": false,
            "showChatBarButton": true
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
          "UnlockedAvatarZoom": {
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
          "ValidReply": {
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
          "VoiceDownload": {
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
          "WebScreenShareFixes": {
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
          },
          "ServerInfo": {
            "enabled": true
          },
          "MessageUpdaterAPI": {
            "enabled": false
          },
          "AppleMusicRichPresence": {
            "enabled": false
          },
          "CopyEmojiMarkdown": {
            "enabled": false
          },
          "DontRoundMyTimestamps": {
            "enabled": false
          },
          "MaskedLinkPaste": {
            "enabled": false
          },
          "NoOnboardingDelay": {
            "enabled": false
          },
          "Summaries": {
            "enabled": false
          },
          "WatchTogetherAdblock": {
            "enabled": false
          }
        },
        "notifications": {
          "timeout": 5000,
          "position": "bottom-right",
          "useNative": "always",
          "logLimit": 50
        },
        "cloud": {
          "authenticated": false,
          "url": "https://api.vencord.dev/",
          "settingsSync": false,
          "settingsSyncVersion": 1718142581346
        }
      }
    '';
  };
}
