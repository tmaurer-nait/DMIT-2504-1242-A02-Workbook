import 'package:flutter/material.dart';
import 'package:navigation_exercise/pages/page_two.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page One'),
            ElevatedButton(
              onPressed: () {
                // MaterialApp provides a root level navigator
                // Use Navigator.of(context) to access the root level navigator
                // Push a new route to page two
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return PageTwo();
                    },
                  ),
                );
              },
              child: Text('Go to page two'),
            ),
          ],
        ),
      ),
    );
  }
}
