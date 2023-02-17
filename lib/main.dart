import 'package:azan_pakistan/strings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
      ),
      drawer: AppDrawer(
        callback: (int selectedPage) {
          Navigator.pop(context);
          setState(() {
            _selectedPage = selectedPage;
          });
        },
      ),
      body: Body(selectedPage: _selectedPage),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Join Us',
        child: const Icon(Icons.handshake),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final int selectedPage;

  const Body({
    Key? key,
    required this.selectedPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (selectedPage) {
      case 0:
        return const HomePage();
      case 1:
        return const WhyPage();
      case 2:
        return const ManifestoPage();
      case 3:
        return const JoinUsPage();
      default:
        return const HomePage();
    }
  }
}

class AppDrawer extends StatelessWidget {
  final void Function(int) callback;

  const AppDrawer({
    super.key,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back)),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () => callback(0),
                        child: const Text(
                          appName,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: () => callback(1),
                          child: const Text('Why Azan Pakistan?')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: () => callback(2),
                          child: const Text('Our Manifesto')),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: () => callback(3),
                          child: const Text('Join Us')),
                    ),
                    IconButton(
                      icon: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.sunny),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        HeadingText('Azan Pakistan'),
        ContentText(
          'Azan Pakistan is a party heading towards the betterment of Pakistan. We have a motive to make Pakistan a welfare state in which people will live in an atmosphere of brotherhood and harmony.',
          padding: EdgeInsets.all(8),
        )
      ],
    );
  }
}

class WhyPage extends StatelessWidget {
  const WhyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        HeadingText('Why Azan Pakistan?'),
        ContentText(
          'Azan Pakistan has a motive to make Pakistan a welfare state in which people will live in an atmosphere of brotherhood and harmony To achieve this goal we will do everything in our strength, we will teach our members and citizens of Pakistan how to fight for their basic human rights.',
          padding: EdgeInsets.all(8),
        )
      ],
    );
  }
}

class ManifestoPage extends StatelessWidget {
  const ManifestoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 12,
        ),
        const HeadingText('Our Manifesto'),
        const SizedBox(
          height: 12,
        ),
        Flexible(
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
            physics: const NeverScrollableScrollPhysics(),
            children: const <Widget>[
              ManifestoGridItem('Economic Growth',
                  'The economy is the first basic pillar of a nation. Looking towards the developed nations, Pakistan should concentrate on building all kinds of industry to strengthen its economy.'),
              ManifestoGridItem('National Security',
                  'Security of Pakistan and its borders is a prime concern issue that can never be forgotten and should be kept ahead in our priorities. For border security, the Pakistan army will be strengthened.'),
              ManifestoGridItem('Education',
                  'Education is the basic right of people it should be provided either free or at a very low cost. We will do our efforts to make education economical for citizens of Pakistan.'),
              ManifestoGridItem('Foreign Policy',
                  'Pakistan should be a prominent country in the upcoming future world. For this, we need strong relations with our neighbors and other countries.'),
              ManifestoGridItem('Justice',
                  'Justice is important to prevail in every field of life, so every citizen of Pakistan may be able to work at a piece of mind.'),
              ManifestoGridItem('Health',
                  'To improve the health condition of our nation we will invest in education, research, and development in the field of health sciences.'),
            ],
          ),
        )
      ],
    );
  }
}

class JoinUsPage extends StatelessWidget {
  const JoinUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[],
    );
  }
}

class HeadingText extends StatelessWidget {
  final String heading;

  const HeadingText(this.heading, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class ContentText extends StatelessWidget {
  final String content;
  final EdgeInsets padding;

  const ContentText(this.content,
      {this.padding = const EdgeInsets.all(0), super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(content),
    );
  }
}

class ManifestoGridItem extends StatelessWidget {
  final String title;
  final String description;

  const ManifestoGridItem(this.title, this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HeadingText(title),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
