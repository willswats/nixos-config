{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    (lib.hiPrio flutter)
  ];

  home.file.".dart-tool/dart-flutter-telemetry.config" = {
    text = ''
      # INTRODUCTION
      #
      # This is the Flutter and Dart telemetry reporting
      # configuration file.
      #
      # Lines starting with a #" are documentation that
      # the tools maintain automatically.
      #
      # All other lines are configuration lines. They have
      # the form "name=value". If multiple lines contain
      # the same configuration name with different values,
      # the parser will default to a conservative value. 

      # DISABLING TELEMETRY REPORTING
      #
      # To disable telemetry reporting, set "reporting" to
      # the value "0" and to enable, set to "1":
      reporting=0

      # NOTIFICATIONS
      #
      # Each tool records when it last informed the user about
      # analytics reporting and the privacy policy.
      #
      # The following tools have so far read this file:
      #
      #   dart-tools (Dart CLI developer tool)
      #   devtools (DevTools debugging and performance tools)
      #   flutter-tools (Flutter CLI developer tool)
      #
      # For each one, the file may contain a configuration line
      # where the name is the code in the list above, e.g. "dart-tool",
      # and the value is a date in the form YYYY-MM-DD, a comma, and
      # a number representing the version of the message that was
      # displayed.
      flutter-tool=2024-03-07,1
      dart-tool=2024-03-07,1
    '';
  };
}
