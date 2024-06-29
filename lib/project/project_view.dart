// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:my_portfolio2/constance.dart';

class ProjectItem {
  final String image;
  final String title;
  final String description;
  final List<String> technologies;
  ProjectItem({
    required this.image,
    required this.title,
    required this.description,
    required this.technologies,
  });
}

final kProjectItems = [
  ProjectItem(
    image: 'images/projekt2.png',
    title: 'Flutter App',
    description: 'App Calculator in Flutter kurs 2024',
    technologies: [
      'Flutter',
      'Dart',
    ],
  ),
  ProjectItem(
    image: 'images/projekt3.png',
    title: 'KTM website',
    description: 'website in einem Praktikum in Kamerun 2023',
    technologies: ['HTML', 'CSS', 'PHP', 'Bootstrap'],
  ),
  ProjectItem(
    image: 'images/projekt1.png',
    title: 'Blog website',
    description: 'Blog website in einem Praktikum in Kamerun 2022',
    technologies: [
      'HTML',
      'CSS',
      'Wordpress',
    ],
  ),
];

class ProjektView extends StatelessWidget {
  const ProjektView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (_, size) {
        if (size.isMobile) return ProjectMobileView();
        return ProjectDesktopView();
      },
    );
  }
}

class ProjectDesktopView extends StatelessWidget {
  const ProjectDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 864,
      width: kInitWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projekts',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final item in kProjectItems)
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(item.image),
                      SizedBox(height: 15),
                      Text(
                        item.title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: 10),
                      Text(item.description),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          for (final tech in item.technologies)
                            Chip(label: Text(tech))
                        ],
                      )
                    ],
                  ),
                ))
            ],
          )
        ],
      ),
    );
  }
}

class ProjectMobileView extends StatelessWidget {
  const ProjectMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
