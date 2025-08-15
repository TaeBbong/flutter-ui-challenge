import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage(), debugShowCheckedModeBanner: false);
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [CardWidget()],
        ),
      ),
    );
  }
}

/// Card
///
/// inspired by https://scontent-icn2-1.cdninstagram.com/v/t51.2885-15/529605583_17843926320551770_3029103728890038012_n.jpg?stp=dst-jpg_e35_tt6&efg=eyJ2ZW5jb2RlX3RhZyI6InRocmVhZHMuQ0FST1VTRUxfSVRFTS5pbWFnZV91cmxnZW4uMTQ0MHgxNDQwLnNkci5mODI3ODcuZGVmYXVsdF9pbWFnZS5jMiJ9&_nc_ht=scontent-icn2-1.cdninstagram.com&_nc_cat=110&_nc_oc=Q6cZ2QF6sxd5ruoFzfNPOCakc8uTe8vwMdSNzWkzvMOlbW09evrI2FYeo90PkFsPiHBWEZ8&_nc_ohc=Mc6JkU0S4P0Q7kNvwGgMwPV&_nc_gid=GEmhrHjeQtTSW7IygSzSFw&edm=AA3DLpEBAAAA&ccb=7-5&ig_cache_key=MzY5NTg0NDk3NDk1NTY1OTQ2MQ%3D%3D.3-ccb7-5&oh=00_AfVI0fknT2YazE3BYwjX-ojatCWQY_IQACwAe5cgof0VkQ&oe=68A4AE7D&_nc_sid=d92198
class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                // width: MediaQuery.of(context).size.width,
                // margin: EdgeInsets.all(8),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                // ),
                child: Image.asset(
                  'assets/imgs/trip.PNG',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 12, 15, 8),
                      child: Text(
                        '바람의 시간표, 우리의 네 번째 여행',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                      child: Text(
                        '2023.2.10 - 2023.2.14',
                        style: TextStyle(color: Colors.black45, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                // TODO: Circle Button
                Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
