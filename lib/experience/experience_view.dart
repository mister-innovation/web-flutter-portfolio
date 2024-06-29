// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_portfolio2/skills/skills_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:my_portfolio2/constance.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (_, size) {
      if (size.isMobile) return ExperienceMobileView();
      return ExperienceDesktopView();
    });
  }
}

class ExperienceMobileView extends StatelessWidget {
  const ExperienceMobileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ExperienceDesktopView extends StatelessWidget {
  ExperienceDesktopView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = ColourAssets.all;
    final experience = experiences.first;

    return Container(
        width: kInitWidth,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 70,
          ),
          Text(
            'Experience',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var index = 0; index < experiences.length / 2; index++)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExperienceWidget(
                      experience: experiences.elementAt(index),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ]));
  }
}

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({
    super.key,
    required this.experience,
  });

  final ExperienceInfo experience;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          //color: Colors.red,

          color: ColourAssets.red,
        ),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.company,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, height: 1.3),
          ),
          Text(
            experience.timeline,
            style: TextStyle(fontSize: 20, height: 1.3),
          ),
          for (final item in experience.descriptions)
            Text(
              item,
              style: TextStyle(fontSize: 20, height: 1.3),
            )
        ],
      ),
    );
  }
}

TextStyle _textStyle(bool isBold) {
  return TextStyle(
    fontSize: 20,
    height: 1.3,
    fontWeight: isBold ?? false ? FontWeight.bold : FontWeight.normal,
  );
}

class ExperienceInfo {
  final String company;
  final String timeline;
  final List<String> descriptions;
  ExperienceInfo({
    required this.company,
    required this.timeline,
    required this.descriptions,
  });
}

final experiences = [
  ExperienceInfo(
      company: 'Webmaster im IT INNOVATION SARL',
      timeline: 'Marz 2022 - April 2023',
      descriptions: [
        '- Erstellung von Websites und Webanwendungen',
        '- Redaktion und Integration von redaktionellen Inhalten, Illustrationen, Videos usw. im SEO-Format,',
        '-  Wartung der Website (Updates, Backups...)',
      ]),
  ExperienceInfo(
      company: 'Praktikum Webmaster im DTA KAMERUN',
      timeline: 'juni 2021 - November 2021',
      descriptions: [
        '- Erstellung einer Website',
        '- Anpassung der Website an die verschiedenen Schnittstellen (Computer, Handy, Tablet...)',
        '- Wartung der Website (Updates, Backups...)',
      ]),
  ExperienceInfo(company: 'THM', timeline: '2023', descriptions: [
    '- Erstellung von Websites und Webanwendungen',
    '- Redaktion und Integration von redaktionellen Inhalten, Illustrationen, Videos usw. im SEO-Format,',
    '-  Wartung der Website (Updates, Backups...)',
  ]),
  ExperienceInfo(company: 'THM', timeline: '2023', descriptions: [
    '- Erstellung von Websites und Webanwendungen',
    '- Redaktion und Integration von redaktionellen Inhalten, Illustrationen, Videos usw. im SEO-Format,',
    '-  Wartung der Website (Updates, Backups...)',
  ]),
];
