import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio2/experience/experience_view.dart';
import 'package:my_portfolio2/header/header_view.dart';
import 'package:my_portfolio2/navigation_bar/navigation_bar_view.dart';
import 'package:my_portfolio2/project/project_view.dart';
import 'package:my_portfolio2/skills/skills_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SERUCHE DONCHI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
            headlineLarge: GoogleFonts.montserrat(fontSize: 60),
            headlineMedium: GoogleFonts.montserrat(fontSize: 30)),
        useMaterial3: true,
      ),
      home: PortfolioView(),
    );
  }
}

class PortfolioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final ScrollController scrollController =
        ScrollController(initialScrollOffset: 1750);

    return Scaffold(
      drawer: DrawerView(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavigationBarView(),
            HeaderView(),
            ProjektView(),
            SkillsView(),
            ExperienceView(),
            Container(height: 100, width: width, color: Colors.green),
            const Text.rich(
              TextSpan(
                text: 'Copyright ', // default text style
                children: <TextSpan>[
                  TextSpan(
                      text: ' Portfolio by ',
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  TextSpan(
                      text: 'Seruche DONCHI',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
              // ...
            },
          ),
        ],
      ),
    );
  }
}
