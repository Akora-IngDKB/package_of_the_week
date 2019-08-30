import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

final images = [
  "https://images.unsplash.com/photo-1567070882023-cd6a27a83b5b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=633&q=80",
  "https://images.unsplash.com/photo-1567072584703-e445170f9478?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
  "https://images.unsplash.com/photo-1567071421696-da30b74734d3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=632&q=80",
  "https://images.unsplash.com/photo-1567157068027-d07bf366c9dd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1534&q=80",
];

class MySwiper extends StatefulWidget {
  final String title;
  final int which;

  MySwiper(this.title, this.which);

  @override
  _MySwiperState createState() => _MySwiperState();
}

class _MySwiperState extends State<MySwiper> {
  final contentList = <Widget>[
    // DEFAULT
    Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          images[index],
          fit: BoxFit.cover,
        );
      },
      itemCount: images.length, // Required parameter
      pagination: SwiperPagination(),
      control: SwiperControl(),
    ),
    // CUSTOM PAGINATION
    Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          images[index],
          fit: BoxFit.cover,
        );
      },
      itemCount: images.length, // Required parameter
      control: SwiperControl(),
      pagination: SwiperPagination(
        margin: EdgeInsets.only(bottom: 20.0),
        builder: SwiperCustomPagination(
          builder: (BuildContext context, SwiperPluginConfig config) {
            return ConstrainedBox(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: config.itemCount,
                  itemBuilder: (context, i) => (i == config.activeIndex)
                      ? ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Container(color: Colors.green, width: 25))
                      : Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              constraints: new BoxConstraints.expand(height: 10.0),
            );
          },
        ),
      ),
    ),
    // STACK LAYOUT
    Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          images[index],
          fit: BoxFit.cover,
        );
      },
      itemCount: images.length, // Required parameter
      pagination: SwiperPagination(),
      control: SwiperControl(),
      layout: SwiperLayout.STACK,
      itemWidth: 300,
      itemHeight: 300,
    ),
    // TINDER LAYOUT
    Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          images[index],
          fit: BoxFit.cover,
        );
      },
      itemCount: images.length, // Required parameter
      pagination: SwiperPagination(),
      control: SwiperControl(),
      layout: SwiperLayout.TINDER,
      itemWidth: 300,
      itemHeight: 300,
    ),
    // CUSTOM LAYOUT
    Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 300,
          child: Image.network(
            images[index],
            fit: BoxFit.cover,
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: images.length, // Required parameter
      viewportFraction: 0.8,
      scale: 0.8,
      autoplay: true,
      autoplayDelay: 50,
      duration: 2000,
      layout: SwiperLayout.CUSTOM,
      curve: Curves.easeInOut,
      customLayoutOption: CustomLayoutOption(
        startIndex: -1,
        stateCount: 3,
      ).addRotate(
        [-270.0 / 180, 0.0, 270.0 / 180],
      ).addTranslate(
        [Offset(150, -350), Offset(0, 50), Offset(-50, 100)],
      ).addOpacity(
        [0, 1, 0],
      ).addScale([0, 1, 0], Alignment.center),
      itemWidth: 300,
      itemHeight: 350,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: contentList[widget.which],
    );
  }
}
