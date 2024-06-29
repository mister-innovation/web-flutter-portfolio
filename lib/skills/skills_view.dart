import 'package:flutter/material.dart';
import 'package:my_portfolio2/constance.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SkillsView extends StatelessWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (_, size) {
      if (size.isMobile) return SkillsMobileView();
      return SkillsDesktopView();
    });
  }
}

class SkillsMobileView extends StatelessWidget {
  const SkillsMobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SkillsDesktopView extends StatelessWidget {
  SkillsDesktopView({
    super.key,
  });

  final skills = [
    'Flutter',
    'Java',
    'HTML',
    'CSS',
    'PHP',
    'WordPress',
    'Canva',
    'Excel'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kInitWidth,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(
            height: 20,
          ),
          for (var rowIndex = 0; rowIndex < skills.length / 4; rowIndex++) ...[
            Row(
              children: [
                for (var index = 0; index < skills.length / 2; index++)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 3,
                                color: ColourAssets.all.elementAt(index)),
                            borderRadius: BorderRadius.circular(3)),
                        child: Text(
                          skills.elementAt((index * 2) + rowIndex),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ]
        ],
      ),
    );
  }
}

class ColourAssets {
  static const Color red = Color.fromRGBO(255, 87, 87, 1);
  static const Color blue = Color.fromRGBO(87, 113, 255, 1);
  static const Color green = Color.fromRGBO(97, 242, 162, 1);
  static const Color yellow = Color.fromRGBO(255, 222, 89, 1);

  static const List<Color> all = [red, blue, green, yellow];
}
