import 'package:animate_do/animate_do.dart';
import 'package:appi_prueba/presentation/presentation.dart';
import 'package:flutter/material.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imagenUrl;

  SlideInfo(this.title, this.caption, this.imagenUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Bienvenido a AppiBook', 'Toda una biblioteca en tu mano!',
      'assets/images/1.png'),
  SlideInfo('Los mejores Libros disponibles',
      'Donde puedes buscar facil y rapido', 'assets/images/2.png'),
  SlideInfo('Podras disponer de ellos siempre',
      'Tus favoritos quedan almacenados', 'assets/images/3.png'),
  SlideInfo('Tu información siempre segura',
      'No te preocupes, cuidamos tus datos!', 'assets/images/5.png'),
];

class LandingScreen extends StatefulWidget {
  static const name = 'landing-screen';

  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  void goToNextPage() {
    final currentPage = pageViewController.page?.toInt() ?? 0;
    if (currentPage < slides.length - 1) {
      pageViewController.jumpToPage(currentPage + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .asMap()
                .map((index, slideData) => MapEntry(
                    index,
                    _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imagenUrl: slideData.imagenUrl,
                      onContinuePressed: goToNextPage,
                      isLastSlide: index == slides.length - 1,
                    )))
                .values
                .toList(),
          ),
          endReached
              ? Positioned(
                  right: 20,
                  top: 50,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                    child: const Text('Comenzar'),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imagenUrl;
  final VoidCallback onContinuePressed;
  final bool isLastSlide;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imagenUrl,
    required this.onContinuePressed,
    required this.isLastSlide,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(imagenUrl)),
            const SizedBox(height: 20),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(height: 10),
            Text(
              caption,
              style: captionStyle,
            ),
            const SizedBox(height: 20),
            if (!isLastSlide)
              FadeInRight(
                from: 15,
                delay: const Duration(seconds: 1),
                child: FilledButton(
                  onPressed: onContinuePressed,
                  child: const Text('Continuar'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
