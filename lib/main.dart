import 'package:dart_groupby/notification_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:collection/collection.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GroupBy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter GroupBy'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late List<NotificationType> _notificationType;
  late List<List<NotificationType>> _notificationType2;

  @override
  void initState() {
    _addData();
    super.initState();
  }

  List<List<NotificationType>> _addData() {
    _notificationType = [];
    _notificationType2 = [];
    _notificationType.add(NotificationType(
      title: 'Title 1',
      categoryId: 1,
    ));
    _notificationType.add(NotificationType(
      title: 'Title 2',
      categoryId: 2,
    ));
    _notificationType.add(NotificationType(
      title: 'Title 3',
      categoryId: 3,
    ));
    _notificationType.add(NotificationType(
      title: 'Title 4',
      categoryId: 4,
    ));
    _notificationType.add(NotificationType(
      title: 'Title 5',
      categoryId: 5,
    ));
    _notificationType.add(NotificationType(
      title: 'Title 6',
      categoryId: 1,
    ));
    _notificationType.add(NotificationType(
      title: 'Title 7',
      categoryId: 2,
    ));
    _notificationType.add(NotificationType(
      title: 'Title 8',
      categoryId: 3,
    ));
    _notificationType.add(NotificationType(
      title: 'Title 9',
      categoryId: 3,
    ));
    _notificationType.add(NotificationType(
      title: 'Title 10',
      categoryId: 3,
    ));

    _notificationType.add(NotificationType(
      title: 'Title 10',
      categoryId: 3,
    ));

    _notificationType.add(NotificationType(
      title: 'Title 11',
      categoryId: 6,
    ));
    _notificationType.add(NotificationType(
      title: 'Title 12',
      categoryId: 7,
    ));
    _notificationType.add(NotificationType(
      title: 'Title 13',
      categoryId: 8,
    ));
    _notificationType.add(NotificationType(
      title: 'Title 14',
      categoryId: 9,
    ));
    _notificationType.add(NotificationType(
      title: 'Title 15',
      categoryId: 10,
    ));
    _notificationType.add(NotificationType(
      title: 'Title 16',
      categoryId: 11,
    ));


    var catMap =
        _notificationType.groupListsBy((element) => element.categoryId);
    _notificationType2.addAll(catMap.values.toList());

    return _notificationType2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  primary: true,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: _notificationType2.length,
                  itemBuilder: (context, index) {
                    List<Widget> wid = _notificationType2[index]
                        .map((e) => CupertinoButton(
                      padding: EdgeInsets.zero,
                          onPressed: (){
                            //on pressed
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('index ${e.categoryId}'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('${e.title}'),
                                  ),
                                ],
                              ),
                          )).toList();

                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                          color: Color(0xFFC2CDD5),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: wid,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

extension Iterables<E> on Iterable<E> {
  Map<K, List<E>> groupBy<K>(K Function(E) keyFunction) => fold(
      <K, List<E>>{},
      (Map<K, List<E>> map, E element) =>
          map..putIfAbsent(keyFunction(element), () => <E>[]).add(element));
}
