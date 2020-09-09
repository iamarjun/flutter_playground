import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  const Level1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  const Level2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Level3(),
        MyTextField(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  const Level3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(Provider.of<Data>(context).data),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(Provider.of<Data>(context).data),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        onChanged: (value) {
          print(value);
          Provider.of<Data>(context, listen: false).changeString(value);
        },
      ),
    );
  }
}

class Data with ChangeNotifier {
  String data = 'Top Secret Data #4';

  void changeString(String newData) {
    data = newData;
    notifyListeners();
  }
}
