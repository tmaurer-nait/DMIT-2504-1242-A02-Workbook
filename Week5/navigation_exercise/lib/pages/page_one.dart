import 'package:flutter/material.dart';
import 'package:navigation_exercise/routes.dart' as routes;

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Page One'),
            ElevatedButton(
              onPressed: () async {
                String returnValue = await Navigator.of(context)
                    .pushNamed(routes.pageTwoRoute) as String;

                setState(() {
                  data = returnValue;
                });
              },
              // onPressed: () {
              //   // MaterialApp provides a root level navigator
              //   // Use Navigator.of(context) to access the root level navigator
              //   // Push a new route to page two
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (context) {
              //         return PageTwo();
              //       },
              //     ),
              //   );
              // },
              child: Text('Go to page two'),
            ),
            data.isNotEmpty ? Text('Received $data') : Text('Awaiting data'),
          ],
        ),
      ),
    );
  }
}
