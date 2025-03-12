import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    'Busca la comida',
    'Sint occaecat eiusmod nostrud nulla elit pariatur deserunt ut.',
    'assets/Images/1.png',
  ),
  SlideInfo(
    'Entregas rápida',
    'Excepteur aliquip mollit reprehenderit in velit proident.',
    'assets/Images/2.png',
  ),
  SlideInfo(
    'Disfruta la comida',
    'Pariatur incididunt voluptate quis commodo in.',
    'assets/Images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewContoller = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewContoller.addListener(() {
      final page = pageViewContoller.page ?? 0;
      if (!endReached && page >= slides.length - 1.5) {
        endReached = true;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    pageViewContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewContoller,
            physics: BouncingScrollPhysics(),
            children:
                slides
                    .map(
                      (slideData) => _Slide(
                        title: slideData.title,
                        caption: slideData.caption,
                        imageUrl: slideData.imageUrl,
                      ),
                    )
                    .toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: Text('Salir'),
            ),
          ),
          endReached
              ? Positioned(
                right: 30,
                bottom: 30,
                child: FadeInRight(
                  from: 15,
                  delay: Duration(seconds: 1),
                  child: FilledButton(
                    onPressed: () => context.pop(),
                    child: Text('Comenzar'),
                  ),
                ),
              )
              : SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final [titleStyle, captionStyle] = [
      textTheme.titleLarge,
      textTheme.bodyMedium,
    ];
    // final captionStyle = Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 20),
            Text(caption, style: captionStyle),
            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
