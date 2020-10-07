import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: 'https://i.ibb.co/PY7pqMS/IMG-20191214-221324.jpg',
            height: 96,
            width: 96,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text('@ikhsan15nur'),
          ),
          SizedBox(
            height: 20,
          ),
          LinkButton(
            title: 'Youtube',
            url: 'https://www.youtube.com/watch?v=6ERQ__yqbk0',
          ),
          LinkButton(
            title: 'LinkedIn',
            url: 'https://www.youtube.com/watch?v=6ERQ__yqbk0',
          ),
          LinkButton(
            title: 'Github',
            url: 'https://www.youtube.com/watch?v=6ERQ__yqbk0',
          ),
          LinkButton(
            title: 'Gitlab',
            url: 'https://www.youtube.com/watch?v=6ERQ__yqbk0',
          ),
          Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Made in Flutter',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                width: 7,
              ),
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image:
                    'https://www.kindpng.com/picc/m/355-3557482_flutter-logo-png-transparent-png.png',
                height: 25,
                width: 25,
              ),
            ],
          ),
          SizedBox(
            height: 23,
          ),
        ],
      ),
    );
  }
}

class LinkButton extends StatelessWidget {
  const LinkButton({
    Key key,
    @required this.title,
    @required this.url,
  }) : super(key: key);

  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final smallWidth = width * 0.95;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SizedBox(
        width: width > 600 ? 600 : smallWidth,
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20),
          onPressed: () => launch(url),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
