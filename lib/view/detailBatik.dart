import 'package:batikku/model/popularBatikModel.dart';
import 'package:batikku/utils/color.dart';
import 'package:batikku/utils/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DetailBatik extends StatefulWidget {
  DetailBatik({this.data});
  Hasil data;

  @override
  _DetailBatikState createState() => _DetailBatikState();
}

class _DetailBatikState extends State<DetailBatik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark1,
      appBar: AppBar(
        backgroundColor: dark1,
        title: Text('Detail Batik ${widget.data.namaBatik}'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: Sizeconfig.lebarLayar * 70,
              decoration: BoxDecoration(
                color: dark2,
                image: DecorationImage(
                  image: NetworkImage(widget.data.linkBatik),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  children: [
                    Text(
                      'Batik ' + widget.data.namaBatik,
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: white,
                        fontSize: Sizeconfig.lebarLayar * 6,
                      )),
                    ),
                    Text(
                      'Dari ' + widget.data.daerahBatik,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: silver,
                        fontSize: Sizeconfig.lebarLayar * 4,
                      )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.data.maknaBatik,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: silver,
                        // fontSize: Sizeconfig.lebarLayar * 3,
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
