class Awesome {
  bool get isAwesome => true;
}
class CommandRunner {
  Future<void> run(List<String> input) async {
    print('CommandRunner received arguments: $input');
  }
}