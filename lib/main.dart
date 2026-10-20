
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFFFF7FF),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xFFFFF7FF),
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FF),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;

            final redWidth = screenWidth * 0.30;
            final blueWidth = screenWidth * 0.24;
            final centerWidth = screenWidth - redWidth - blueWidth;

            final yellowWidth = centerWidth * 0.66;
            final yellowHeight =
            (screenHeight * 0.12).clamp(120.0, 220.0);

            return Row(
              children: [
                // Left: Red box
                Container(
                  width: redWidth,
                  height: double.infinity,
                  color: const Color(0xFFF44336),
                ),

                // Middle: Tappable yellow counter box
                SizedBox(
                  width: centerWidth,
                  height: double.infinity,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          counter++;
                        });
                      },
                      child: Container(
                        width: yellowWidth,
                        height: yellowHeight,
                        alignment: Alignment.center,
                        color: const Color(0xFFFFEB3B),
                        padding: const EdgeInsets.all(5),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Counter Value : $counter',
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 26,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Right: Green for even, blue for odd
                Container(
                  width: blueWidth,
                  height: double.infinity,
                  color: counter.isEven
                      ? Colors.green
                      : const Color(0xFF2196F3),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
