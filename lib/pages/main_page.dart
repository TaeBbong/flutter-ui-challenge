import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // final _pageCtrl = PageController(viewportFraction: 0.9);
  final _pageCtrl = PageController();
  final _images = const [
    'assets/imgs/good_boys.jpg',
    'assets/imgs/joker.jpg',
    'assets/imgs/the_hustle.jpg',
  ];
  int _index = 0;

  @override
  void initState() {
    super.initState();
    // 배경 미리 로드(깜빡임 방지)
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      for (final p in _images) {
        await precacheImage(AssetImage(p), context);
      }
    });
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedSwitcher(
            switchInCurve: Curves.easeOut,
            switchOutCurve: Curves.easeIn,
            duration: const Duration(milliseconds: 450),
            child: SizedBox.expand(
              key: ValueKey(_index),
              child: Image.asset(_images[_index], fit: BoxFit.cover),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 640,
                  width: 320,
                  child: PageView.builder(
                    controller: _pageCtrl,
                    onPageChanged: (i) => setState(() => _index = i),
                    itemCount: _images.length,
                    padEnds: false,
                    itemBuilder: (context, i) {
                      return AnimatedBuilder(
                        animation: _pageCtrl,
                        builder: (context, child) {
                          // 살짝 scale 효과(선택)
                          double t = 1.0;
                          if (_pageCtrl.position.haveDimensions) {
                            final page =
                                _pageCtrl.page ??
                                _pageCtrl.initialPage.toDouble();
                            t = (1 - (page - i).abs() * 0.08).clamp(0.9, 1.0);
                          }
                          return Transform.scale(scale: t, child: child);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: _CarouselCard(index: i),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                // _Dots(
                //   count: _images.length,
                //   index: _index,
                //   onTap:
                //       (i) => _pageCtrl.animateToPage(
                //         i,
                //         duration: const Duration(milliseconds: 300),
                //         curve: Curves.easeOut,
                //       ),
                // ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CarouselCard extends StatelessWidget {
  final _images = const [
    'assets/imgs/good_boys.jpg',
    'assets/imgs/joker.jpg',
    'assets/imgs/the_hustle.jpg',
  ];
  final int index;
  const _CarouselCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.9),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(_images[index], fit: BoxFit.cover),
            ),
            const Text(
              '여기에 Column 형태의 컨텐츠를 배치하세요.\n'
              '버튼, 텍스트, 입력폼 등 자유롭게.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton(onPressed: () {}, child: const Text('Action')),
          ],
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int count;
  final int index;
  final void Function(int) onTap;
  const _Dots({required this.count, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: List.generate(count, (i) {
        final selected = i == index;
        return GestureDetector(
          onTap: () => onTap(i),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: selected ? 18 : 8,
            height: 8,
            decoration: BoxDecoration(
              color: selected ? Colors.white : Colors.white70,
              borderRadius: BorderRadius.circular(99),
              border: Border.all(color: Colors.white.withOpacity(0.9)),
            ),
          ),
        );
      }),
    );
  }
}
