import 'package:flutter/material.dart';
import 'package:pow_flutter_swiper/swiper.dart';

void main() => runApp(
      MaterialApp(
        title: 'Flutter Swipe',
        home: SwipeHome(),
        theme: ThemeData(primarySwatch: Colors.deepPurple),
      ),
    );

class SwipeHome extends StatefulWidget {
  @override
  _SwipeHomeState createState() => _SwipeHomeState();
}

class _SwipeHomeState extends State<SwipeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Swipe')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            MaterialButton(
              color: Colors.deepPurple,
              minWidth: 150,
              shape: StadiumBorder(),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => MySwiper('Normal', 0))),
              elevation: 12,
              child: Text('DEFAULT', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.deepPurple,
              minWidth: 150,
              shape: StadiumBorder(),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => MySwiper('Custom Pagination', 1))),
              elevation: 12,
              child: Text('CUSTOM PAGINATION',
                  style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.deepPurple,
              minWidth: 150,
              shape: StadiumBorder(),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => MySwiper('Stack Layout', 2))),
              elevation: 12,
              child:
                  Text('STACK LAYOUT', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.deepPurple,
              minWidth: 150,
              shape: StadiumBorder(),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => MySwiper('Tinder Layout', 3))),
              elevation: 12,
              child:
                  Text('TINDER LAYOUT', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.deepPurple,
              minWidth: 150,
              shape: StadiumBorder(),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => MySwiper('Custom Layout', 4))),
              elevation: 12,
              child:
                  Text('CUSTOM LAYOUT', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
