import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Get Started'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/task.png',
                width: 300,
                height: 300,
              ),
              ElevatedButton(
                child: const Text('Start'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/home');
                },
              ),
            ],
          ),
        ));
  }
}
