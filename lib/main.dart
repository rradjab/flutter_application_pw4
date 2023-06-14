import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Список ссылок на картинки
  Map<String, List<String>> imagesMap = {
    'Мои фото': [
      'https://picsum.photos/1000/303',
      'https://picsum.photos/1000/304',
      'https://picsum.photos/1000/305',
      'https://picsum.photos/1000/306',
      'https://picsum.photos/1000/307',
      'https://picsum.photos/1000/308',
      'https://picsum.photos/1000/309',
      'https://picsum.photos/1000/310',
      'https://picsum.photos/1000/311',
      'https://picsum.photos/1000/312',
    ],
    'Галерея': [
      'https://picsum.photos/700/701',
      'https://picsum.photos/700/702',
      'https://picsum.photos/700/703',
      'https://picsum.photos/700/704',
      'https://picsum.photos/700/705',
      'https://picsum.photos/700/706',
      'https://picsum.photos/700/707',
      'https://picsum.photos/700/708',
      'https://picsum.photos/700/709',
      'https://picsum.photos/700/710',
    ]
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              centerTitle: true,
              title: const Text('keys'),
              //создаем таббар и берем названия табов из списка - nav
              bottom: TabBar(
                  tabs: imagesMap.keys
                      .map((String item) => Tab(
                            text: item,
                          ))
                      .toList()),
            ),
            body: TabBarView(
              //внутри виджета TabBarView исходя из количества элементов
              //в списке nav создаем ListView виджеты внутри которой будут
              //так же виджеты отображающие картинки полученные из сети
              //списки находятся в map-е названием img, вызыватся каждый по key
              children: imagesMap.keys
                  .map(
                    (e) => ListView(
                      //исползуется для сохранения состояния при переключении
                      key: PageStorageKey(e),
                      children: <Widget>[
                        //с помощью цикла полученные ссылки будут переданы
                        //создавшиемся виджетам которые отображают картинки
                        //по указанным ссылкам
                        for (var item in imagesMap[e] as List<String>)
                          //для красоты используется отступ Padding
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(item),
                          ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
