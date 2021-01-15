import 'package:batikku/bloc/popularBatikBloc.dart';
import 'package:batikku/model/popularBatikModel.dart';
import 'package:batikku/utils/color.dart';
import 'package:batikku/utils/sizeConfig.dart';
import 'package:batikku/view/detailBatik.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    blocPopularBatik.getPopularBatik();
    Sizeconfig().init(context);
    return StreamBuilder(
        stream: blocPopularBatik.popularbatik,
        builder: (context, AsyncSnapshot<PopolarBatikModel> getapi) {
          if (getapi.hasData) {
            return Scaffold(
              backgroundColor: dark1,
              appBar: AppBar(
                backgroundColor: dark1,
                title: Text('Batik Ku'),
              ),
              body: Container(
                child: ListView.builder(
                    itemCount: getapi.data.hasil.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                        decoration: BoxDecoration(
                          color: dark2,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailBatik(
                                            data: getapi.data.hasil[i])));
                              },
                              child: Container(
                                height: Sizeconfig.lebarLayar * 50,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${getapi.data.hasil[i].linkBatik}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                              child: Text(
                                'Nama Batik : ${getapi.data.hasil[i].namaBatik}',
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                  color: white,
                                )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                              child: Text(
                                'Daerah Batik : ${getapi.data.hasil[i].daerahBatik}',
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                  color: silver,
                                )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                              child: Text(
                                'Kisaran Harga : ${getapi.data.hasil[i].hargaRendah} sd/ ${getapi.data.hasil[i].hargaTinggi}',
                                style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                  color: silver,
                                )),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            );
          } else if (getapi.hasError) {
            return Text(getapi.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
