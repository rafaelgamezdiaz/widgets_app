import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicators')),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          // Circular Progress Indicator
          const SizedBox(height: 30),
          const Text('CircularProgressIndicator'),
          const SizedBox(height: 20),
          const CircularProgressIndicator(
            strokeWidth: 4,
            color: Colors.deepOrange,
            backgroundColor: Colors.black12,
          ),

          // Linear Progress Indicator
          const SizedBox(height: 30),
          const Text('Progrees Indicator controlled'),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: const LinearProgressIndicator(),
          ),

          // Controlled Progress Indicator
          const SizedBox(height: 30),
          const Text('Controlled Progrees Indicator'),
          const SizedBox(height: 20),
          _ControlledProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: Stream.periodic(
        const Duration(milliseconds: 120),
        (value) => (value * 2) / 100,
      ).takeWhile((value) => value <= 100),
      builder: (context, snapshot) {
        final progressValue = (snapshot.data ?? 0.0) as double;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 4,
                color: Colors.deepOrange,
                backgroundColor: Colors.black12,
              ),
              SizedBox(width: 20),
              Expanded(child: LinearProgressIndicator(value: progressValue)),
              if (progressValue <= 1)
                Text('${(progressValue * 100).toStringAsFixed(2)}%'),
            ],
          ),
        );
      },
    );
  }
}
