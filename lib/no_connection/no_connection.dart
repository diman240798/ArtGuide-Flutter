import 'package:flutter/material.dart';

class NoConnectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'images/no_connection.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: IconButton(
              iconSize: 200,
              icon: Image.asset('images/no_connection_button.png'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: Text('Соединение отсутсвует'),
                        content: Text(
                            'Если вы видите данное сообщение, значит на вашем телефоне отсуствует интернет-соединение или отключен GPS. Обе эти функциональности необходимы для корректной работы карты.'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('OK'),
                            onPressed: () => Navigator.pop(context),
                          )
                        ],
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: NoConnectionPage(),
    ));
