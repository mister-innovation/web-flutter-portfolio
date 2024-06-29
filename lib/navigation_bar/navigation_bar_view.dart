// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBarView extends StatelessWidget {
  const NavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        final onPress = () => print('click');
        final text = 'About Me';
        return Container(
          height: 100,
          width: 1507,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Image.asset(
                'images/seruche.png',
                height: 700,
              ),
              Spacer(),
              for (var item in kNavigationItems)
                NavigationBarItem(onPress: onPress, text: item.text),
            ],
          ),
        );
      },
    );
  }
}

class NavigationItem {
  final String text;

  NavigationItem(this.text);
}

final kNavigationItems = [
  NavigationItem('Projekts'),
  NavigationItem('Skills'),
  NavigationItem('About Me'),
  NavigationItem('Blog'),
];

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.onPress,
    required this.text,
  });

  final void Function() onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 64),
      child: InkWell(
        onTap: onPress,
        mouseCursor: MaterialStateMouseCursor.clickable,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
