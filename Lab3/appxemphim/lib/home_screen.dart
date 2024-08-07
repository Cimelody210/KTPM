
import 'package:appxemphim/api/API.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/phim.dart';
import 'widgets/phimdangchieu.dart';
import 'widgets/phimhot.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

late Future<List<Phim>> phimHot;

@override
void initState() {
  super.initState();
  phimHot = API().getPhimHot();
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/download.png',
          fit: BoxFit.cover,
          height: 100,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phim Hot', 
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              const SizedBox(height: 30),
              const PhimHot(),
              const SizedBox(height: 30),
              Text(
                'Phim Đang Chiếu',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25
                ),
              ),
              const SizedBox(height: 30),
              const phimdangchieu(),
             const SizedBox(height: 30),
              Text(
                'Phim Sắp Chiếu',
                style: GoogleFonts.aBeeZee(
                  fontSize: 25
                ),
              ),
              const SizedBox(height: 30),
              const phimdangchieu(),
            ],
          ),
        ),
      ),
    );
  }
}


