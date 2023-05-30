import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'general_row.dart';
import 'reviews_row.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Future.delayed(const Duration(seconds: 1), () {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chicago Attractions',
      home: const MyHomePage(title: 'Chicago Attractions'),
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Background
  String backgroundColor = "0xff343a40";
  // Tab Bar
  String tabBarBackgroundColor = "0xff161a1d";
  String indicatorColor = "0xffEEEEEE";
  // Text
  String textTitleColor = "0xffEDEDED";
  String titleBackgroundColor = "0xff161a1d";

  List<String> imagePaths = [
    'assets/images/lion.jpg',
    'assets/images/bone.jpg',
    'assets/images/art.jpg',
  ];

  List<String> generalTitles = [
    'Lincoln Park Zoo',
    'Museum of Science',
    'The Art Institute\nof Chicago',
  ];

  List<String> reviewsTitles = [
    'Lincoln Park Zoo',
    'Museum of Science',
    'The Art Institute of Chicago',
  ];

  List<String> addresses = [
    '2001 N Clark St,\nChicago, IL 60614',
    '5700 S Lake Shore Dr,\nChicago, IL, 60637',
    '111 S Michigan Ave,\nChicago, IL, 60603',
  ];

  List<String> descriptions = [
    "Visiting the Lincoln Park Zoo offers a captivating experience, immersing you in a world of diverse wildlife while providing an enjoyable escape from the bustling city, all within the serene and picturesque surroundings of Lincoln Park.",
    "Explore the fascinating world of science at the Museum of Science, where captivating exhibits, interactive displays, and engaging activities await, offering an enriching and entertaining experience for visitors of all ages.",
    "Experience art's grandeur at The Art Institute of Chicago, home to a vast collection of masterpieces that captivate and inspire visitors with their timeless beauty and cultural significance.",
  ];

  final int _index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: _index,
      length: 2,
      child: Scaffold(
        backgroundColor: Color(int.parse(backgroundColor)),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200.0),
          child: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              // Status bar color
              statusBarColor: Colors.transparent,
              // Status bar brightness (optional)
              statusBarIconBrightness:
              Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            title: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                //color: Color(int.parse(boxColor)), // Semi-transparent black background color
                color: Color(int.parse(titleBackgroundColor)).withOpacity(0.9),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "Explore Chicago's Attractions",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(int.parse(textTitleColor)),
                ),
              ),
            ),
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              stretchModes: const <StretchMode>[
                StretchMode.blurBackground,
              ],
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset('assets/images/City.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Container(
                color: Color(int.parse(tabBarBackgroundColor)).withOpacity(
                    0.9), // Set the background color of the TabBar to semi-transparent black
                child: TabBar(
                  indicatorColor: Color(int.parse(indicatorColor)),
                  labelColor: Colors.black,
                  tabs: const <Widget>[
                    Tab(
                      child: Text(
                        'General Info',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 19,
                          color: Color(0xfff8f9fa),
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Reviews',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 19,
                          color: Color(0xfff8f9fa),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                3,
                    (index) => GeneralRow(
                  imagePath: imagePaths[index],
                  title: generalTitles[index],
                  address: addresses[index], key: null,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                3,
                    (index) => ReviewRow(
                  title: reviewsTitles[index],
                  description: descriptions[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}