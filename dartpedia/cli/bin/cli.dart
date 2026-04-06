const version = '0.0.1';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } 
  else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  }
  else if (arguments.first == 'search') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  }
  else {
    printUsage();
  }
}
void searchWikipedia(List<String>? arguments) {
  print('searchWikipedia получила аргументы: $arguments');
}
void printUsage() {
  print(
    "Доступные команды: 'help', 'version', 'search <Название_статьи>'"
  );
}