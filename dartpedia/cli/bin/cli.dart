const version = '0.0.1';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } 
  else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  }
  else if (arguments.first == 'search') {
    print('Команда search распознана!');
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
    "Доступные команды: 'help', 'version', 'search <Название статьи>'"
  );
}
