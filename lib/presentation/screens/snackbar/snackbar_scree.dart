import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final SnackBar snackBack = SnackBar(
      content: const Text('Hello! I am a SnackBar.'),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBack);
  }

  void openDialog(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (BuildContext context) => AlertDialog(
            title: const Text('Mostrar Modal'),
            content: const Text(
              'Do labore aliqua ad sit minim occaecat in aute. Laboris cupidatat ut fugiat velit excepteur proident cupidatat deserunt mollit sunt. Consectetur tempor nisi dolore laboris ea elit magna magna culpa exercitation. Fugiat excepteur do quis esse esse ullamco. Irure sunt non ullamco mollit labore ad voluptate elit ad id consequat commodo. Ullamco et culpa incididunt adipisicing ea cupidatat mollit nulla mollit. In incididunt eiusmod deserunt sunt eiusmod amet ullamco velit dolor aliqua nostrud ex.',
            ),
            actions: <Widget>[
              FilledButton(
                onPressed: () => context.pop(),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    colors.inverseSurface,
                  ),
                ),
                child: const Text('Cerrar'),
              ),
              FilledButton(onPressed: () => context.pop(),, child: const Text('Aceptar')),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar and Dialogs')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: const <Widget>[
                    Text(
                      'Commodo sunt eu proident enim cillum mollit in commodo sint et irure aliquip duis occaecat. Est proident duis laboris anim ullamco. Consectetur tempor consectetur minim nisi dolore ipsum excepteur proident. Est anim veniam laboris enim. Est incididunt sint occaecat ipsum aliquip adipisicing.',
                    ),
                  ],
                );
              },
              child: Text('Used Licenes'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: Text('Show Dialog'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context),
        label: const Text('Show Snackbar'),
        icon: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
