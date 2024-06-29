import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio2/constance.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, size) {
        if (size.isMobile) return HeaderMobileView();
        return Container(
          height: 864,
          width: kInitWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: HeaderBody(isMobile: true),
                ),
                Image.asset(
                  'images/header.jpeg',
                  height: 700,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HeaderBody extends StatelessWidget {
  final bool isMobile;
  const HeaderBody({
    super.key,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Ich bin Seruche',
          style: Theme.of(context).textTheme.headlineLarge,
          maxLines: 1,
        ),
        AutoSizeText(
          'Flutter developper',
          style: Theme.of(context).textTheme.headlineLarge,
          maxLines: 1,
        ),
        SizedBox(height: isMobile ? 20 : 37),
        AutoSizeText(
          'Ich lerne Flutter in der THM seit 2 monate',
          style: TextStyle(fontSize: 24),
          maxLines: 3,
        ),
        SizedBox(height: isMobile ? 20 : 40),
        TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              backgroundColor: Colors.redAccent,
            ),
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 10 : 17,
                horizontal: isMobile ? 8 : 15,
              ),
              child: Text(
                'Contact Me',
                style: TextStyle(
                  fontSize: isMobile ? 20 : 24,
                  color: Colors.white,
                ),
              ),
            ))
      ],
    );
  }
}

class HeaderMobileView extends StatelessWidget {
  const HeaderMobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.9,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          FlutterLogo(size: height * 0.3),
          Spacer(),
          HeaderBody(isMobile: true),
        ],
      ),
    );
  }
}
