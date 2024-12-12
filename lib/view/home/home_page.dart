import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loto_mks/provider/loto_provider.dart';
import 'package:loto_mks/view/loto/circle_button.dart';
import 'package:loto_mks/view/loto/loto_page.dart' show LotoPage;
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: ChangeNotifierProvider.value(
        value: LotoProvider(),
        child: Consumer<LotoProvider>(
          builder: (BuildContext context, provider, Widget? child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'JEU DU BINGO !',
                  style: TextStyle(
                    fontSize: 96,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.black.withValues(red: 0.5),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey.withValues(alpha: 0.3),
                  thickness: 2,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: CircleButton(
                            icon: FontAwesomeIcons.circlePlay,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LotoPage(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: Text(
                            'Jeu réalisé par Émile Makusa et Cedric Willem',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              shadows: [
                                Shadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 1.0,
                                  color: Colors.black.withValues(alpha: 0.5),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
