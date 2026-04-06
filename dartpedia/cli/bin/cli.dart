import 'dart:io';
import 'package:http/http.dart' as http;

const version = '0.0.1';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search') {
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void searchWikipedia(List<String>? arguments) async {
  final String articleTitle;

  if (arguments == null || arguments.isEmpty) {
    print('Пожалуйста, введите название статьи.');
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    articleTitle = arguments.join(' ');
  }

  print('Ищем статьи о "$articleTitle". Пожалуйста, подождите.');
  print('Вот что нашлось:');
  print('(Представьте, что это настоящая статья о "$articleTitle")');
}

Future<String> getWikipediaArticle(String articleTitle) async {
  final url = Uri.https(
    'en.wikipedia.org',
    '/api/rest_v1/page/summary/$articleTitle',
  );
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return response.body;
  }

  return 'Ошибка: Не удалось загрузить статью "$articleTitle". Код статуса: ${response.statusCode}';
}

void printUsage() {
  print(
    "Доступные команды: 'help', 'version', 'search <НАЗВАНИЕ_СТАТЬИ>'"
  );
}