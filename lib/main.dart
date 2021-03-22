import 'package:flutter/material.dart';
import 'package:learn_flutter_with_provider/application_color.dart';
import 'package:provider/provider.dart';

void main() => runApp(RootApp());

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<ApplicationColor>(
        builder: (context) => ApplicationColor(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: false,
            title: Consumer<ApplicationColor>(
              builder: (context, applicationColor, _) => Text(
                'Provider State Management',
                style: TextStyle(color: applicationColor.color),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<ApplicationColor>(
                  builder: (context, applicationColor, _) => AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    width: 100,
                    height: 100,
                    color: applicationColor.color,
                    margin: EdgeInsets.all(5),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text('AB'),
                    ),
                    Consumer<ApplicationColor>(
                        builder: (context, applicationColor, _) => Switch(
                              value: applicationColor.isLightBlue,
                              onChanged: (newVal) {
                                applicationColor.isLightBlue = newVal;
                              },
                            )),
                    Container(
                      margin: EdgeInsets.all(5),
                      child: Text('LB'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
