
import 'package:flutter/material.dart';
import 'package:flutter_full/Exercise2/Model/color_counter.dart' as model;
import 'package:flutter_full/Exercise2/Model/color_counter.dart';
import 'package:provider/provider.dart';

void main(){
  // Provide the model to the app root widget using a ChangeNotifier 
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorCounter(),
       child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Homeview()
        ),
    ),
  ));
  
 
}

// 3. Removw all start drilling and start in every widget
class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
   int _currentIndex = 0;
   void navigateToStatistics() {
    setState(() {
      _currentIndex = 1;
    });
  }
  
  @override
  Widget build(BuildContext context) {
     
     return Scaffold(
      body: _currentIndex == 0
          ? const ColorTapsScreen()
          : const StatisticsScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.color_lens),
            label: 'Color Taps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}

// - update Color TapScreen widget use tapCounter from the provider 
class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
  
    return const Column(
      children:  [
        ColorTap(type: model.CardType.red),
        ColorTap(type: model.CardType.blue),
      ],
    );
  }
}

// wrap the widgte who need the model with a consumer 
class ColorTap extends StatelessWidget {
  final CardType type;
  const ColorTap({
    super.key,
    required this.type,
    });
  Color get backgroundColor =>
      type == CardType.red ? Colors.red : Colors.blue;

  @override
  Widget build(BuildContext context) {
    print("Color Tap build");
    return  GestureDetector(
      onTap: () {
        if (type == CardType.red) {
          context.read<ColorCounter>().incrementRedTapCount();
        } else {
          context.read<ColorCounter>().incrementBlueTapCount();
        }
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text(
            'Taps: ${type == CardType.red ? context.watch<ColorCounter>().redTapCount: context.watch<ColorCounter>().blueTapCount}',
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
     print("StatisticsScreen build");
     
     return  Scaffold(
      appBar: AppBar(title: const Text("Statistics")),
       body: Consumer<ColorCounter>(
         builder: (context, counter, child) {
           return Center(
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Red taps: ${counter.redTapCount}",
                 style: const TextStyle(fontSize: 24) ),
                 Text("Blue taps: ${counter.blueTapCount}",
                 style: const TextStyle(fontSize: 24),
                 ),
               ],
             ),
           );
         },
     )
     );
     
  }
}