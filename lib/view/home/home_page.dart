import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loto_mks/components/floating_toolbar.dart';
import 'package:loto_mks/models/toolbar_button.dart';
import 'package:loto_mks/provider/loto_provider.dart';
import 'package:loto_mks/view/loto/loto_page.dart' show LotoPage;
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: LotoProvider(),
        child: Consumer<LotoProvider>(
          builder: (BuildContext context, provider, Widget? child) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFCFD8DC),
                    Color(0xFF455A64),
                    Color(0xFF263238),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Text(
                      'JEU DU BINGO !',
                      style: GoogleFonts.luckiestGuy(
                        fontSize: 96,
                        color: Color(0xFF1A237E),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Card(
                      color: Color(0xFFECEFF1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Règle du jeu :',
                              style: GoogleFonts.luckiestGuy(
                                fontSize: 30,
                                color: Color(0xFF1A237E),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "L'objectif du jeu est d'être le premier à obtenir tous les numéros jusqu'à remplir le carton entier. Lorsque le carton est rempli, crier :",
                              style: GoogleFonts.luckiestGuy(
                                fontSize: 24,
                                color: Color(0xFF1A237E),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Bingo !',
                              style: GoogleFonts.luckiestGuy(
                                fontSize: 58,
                                color: Color(0xFF1A237E),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                content: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Exemple de carton :',
                                        style: GoogleFonts.luckiestGuy(
                                          fontSize: 24,
                                          color: Color(0xFF1A237E),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 16),
                                      Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        elevation: 4,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            'assets/grids/grid-exemple.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(8.0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Fermer',
                                        style: GoogleFonts.luckiestGuy(
                                          fontSize: 14,
                                          color: Color(0xFF1A237E),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFCFD8DC),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Voir un exemple de carton',
                            style: GoogleFonts.luckiestGuy(
                              fontSize: 20,
                              color: Color(0xFF1A237E),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    FloatingToolbar(
                      buttons: [
                        ToolbarButtonData(
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
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Jeu réalisé par Émile Makusa et Cedric Willem',
                      style: GoogleFonts.luckiestGuy(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
