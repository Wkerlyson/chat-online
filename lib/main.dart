import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final ThemeData kIOSTheme = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.grey[100],
    primaryColorBrightness: Brightness.light);

final ThemeData kDefaultTheme = ThemeData(
    primarySwatch: Colors.purple, accentColor: Colors.orangeAccent[400]);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Online',
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).platform == TargetPlatform.iOS
          ? kIOSTheme
          : kDefaultTheme,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat App'),
          centerTitle: true,
          elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0 : 4.0,
        ),
        body: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: TextComposer(),
            )
          ],
        ),
      ),
    );
  }
}

class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  bool _isComposing = false;

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: Theme.of(context).platform == TargetPlatform.iOS
            ? BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey[200])))
            : null,
        child: Row(
          children: <Widget>[
            Container(
              child: IconButton(
                icon: Icon(Icons.photo_camera,
                    semanticLabel: 'Clique aqui para escolher uma foto'),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: TextField(
                decoration:
                    InputDecoration.collapsed(hintText: 'Send a message'),
                onChanged: (text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: Theme.of(context).platform == TargetPlatform.iOS
                  ? CupertinoButton(
                      child: Text('Send', semanticsLabel: 'Enviar mensagem'),
                      onPressed: _isComposing ? () {} : null)
                  : IconButton(
                      icon: Icon(Icons.send, semanticLabel: 'Enviar mensagem'),
                      onPressed: _isComposing ? () {} : null),
            )
          ],
        ),
      ),
    );
  }
}
