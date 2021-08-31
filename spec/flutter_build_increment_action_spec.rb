describe Fastlane::Actions::FlutterBuildIncrementAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The flutter_build_increment plugin is working!")

      Fastlane::Actions::FlutterBuildIncrementAction.run(nil)
    end
  end
end
