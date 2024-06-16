import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ricky_morti/screens/all_cast_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  AllCastScreen()), 
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF9DFE00),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -258,
            top: -258,
            child: SizedBox(
              width: 932,
              height: 932,
              child: SvgPicture.asset(
                'assets/vectors/group_1_x2.svg', 
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.fromLTRB(7, 250, 7, 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 171),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/rick_and_morty_310131.png',
                          ),
                        ),
                      ),
                      child: Container(
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(9.5, 0, 8.5, 12),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.5),
                              gradient: const SweepGradient(
                                center: Alignment(0, 0),
                                startAngle: 1.57,
                                endAngle: 7.85,
                                tileMode: TileMode.repeated,
                                colors: <Color>[Color(0xFF191D29), Color(0x00191D29)],
                                stops: <double>[0, 1],
                              ),
                            ),
                            child: Container(
                              width: 33,
                              height: 33,
                              padding: const EdgeInsets.fromLTRB(13.8, 27.5, 13.7, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF191D29),
                                  borderRadius: BorderRadius.circular(2.8),
                                ),
                                child: Container(
                                  width: 5.5,
                                  height: 5.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Loading',
                          style: GoogleFonts.getFont(
                            'Plus Jakarta Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            height: 1.4,
                            color: const Color(0xFF191D29),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


