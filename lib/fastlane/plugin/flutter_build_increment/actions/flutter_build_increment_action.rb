require 'fastlane/action'
require_relative '../helper/flutter_build_increment_helper'

module Fastlane
  module Actions
    class FlutterBuildIncrementAction < Action
      def self.run(params)
        UI.message("The flutter_build_increment plugin is working!")
        file_name = '../pubspec.yaml'
        text = File.read(file_name)
        new_contents = text.gsub(/^(version:\s*\d+.\d+.\d+\+)(\d+)/) { |m| m.gsub!($2) {|num| num.to_i + 1}  }  
        # To write changes to the file, use:
        File.open(file_name, "w") {|file| file.puts new_contents }
      end

      def self.description
        "Increments pubspec.yaml build version number i.e. 1.0.0+1 to 1.0.0+2"
      end

      def self.authors
        ["Matthias Seiderer"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Increments pubspec.yaml build version number i.e. 1.0.0+1 to 1.0.0+2"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "FLUTTER_BUILD_INCREMENT_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
