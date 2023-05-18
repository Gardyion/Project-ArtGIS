import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:project_artgis/testmap.dart';

void main() {
  runApp(const MyApp());
  print("BreArts has been started");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project ArtGIS',
      theme: ThemeData(
        primarySwatch: Colors.orange,

      ),
      home: const MyHomePage(title:'Welcome to BreArts!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _GotoGISMap() {

    if(mounted){
      setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage())
        );
      });
    }
  }

  void _GotoInfoDialog()
  {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(context)
            .modalBarrierDismissLabel,
        barrierColor: const Color.fromRGBO(255, 255, 255, 0.90),
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext,
            Animation animation,
            Animation secondaryAnimation) {

          return Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 10,
                    height: MediaQuery.of(context).size.height -  25,
                    padding: EdgeInsets.all(20),
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Material(
                          color: Colors.transparent,
                          // borderRadius: BorderRadius.circular(5),
                          child:Stack(
                              children:[
                                Text(
                                  "Original data sourced from",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.raleway(textStyle:const TextStyle(color: const Color(0xff9400D3), fontSize: 22)),
                                ),

                              ]),
                        ),

                        Material(
                          color: Colors.transparent,
                          child:Stack(
                              children:[
                                 SelectableText(
                                  "http://gisweb.cityofbrea.net/Html5Viewer/Index.html?viewer=breaarts",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.raleway(textStyle:const TextStyle(color: const Color(0xff9400D3),
                                      fontWeight: FontWeight.bold, fontSize: 22)),
                                ),

                              ]),
                        ),


                        SizedBox(height: 30),

                        Material(
                          color: Colors.transparent,
                          child:Stack(
                              children:[
                                Text(
                                  "Usable data created in ArcGIS Pro, published as ArcGIS Online layer, "
                                      "located here: ",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.raleway(textStyle:const TextStyle(color: const Color(0xff9400D3), fontSize: 22)),
                                ),

                              ]),
                        ),

                        Material(
                          color: Colors.transparent,
                          child:Stack(
                              children:[
                                SelectableText(
                                  "https://services3.arcgis.com/NaFf4UaPo3IgQXqn/"
                                      "arcgis/rest/services/Brea_Arts_V2_WFL1/FeatureServer/",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.raleway(textStyle:const TextStyle(color: const Color(0xff9400D3),
                                      fontWeight:FontWeight.bold, fontSize: 22)),
                                ),

                              ]),
                        ),

                        SizedBox(height: 35),

                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF9800),
                              padding: const EdgeInsets
                                  .symmetric(horizontal: 10, vertical: 4),),
                            //  color: const Color(0xFF1BC0C5),
                            child: Text("exit",
                                style: GoogleFonts.cormorantGaramond(textStyle:const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)))),
                      ],
                    ),
                  ),
                ),


              ]);
        });
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
    Image.asset(
    "assets/brea-stock.jpg",
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
      color: Colors.blueAccent,
      colorBlendMode: BlendMode.color,
      opacity: const AlwaysStoppedAnimation(0.55),
    ),

    Scaffold(
      backgroundColor: Colors.transparent,
/*      appBar: AppBar(

        title: Text(widget.title,
            style: const TextStyle(color: Colors.white)),
      ),*/
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children:  <Widget>[

            Container(
              width: 225,
              height: 225,
              child:  const Material(
                color: Colors.white,
                shadowColor: Colors.black,
                shape:CircleBorder(
                  side: BorderSide(
                    color: Colors.black,
                    width: 2.5,
                  ),
                ),
                child: Image(image: AssetImage('assets/breaartstotallogo_removebg.png')),
              ),

            ),

            SizedBox(height: 30),


            Container(
              width: 320,
              height:140,
              alignment: Alignment.center,
              child: Material(
                color:const Color(0xffFFB74D),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)),),
                child:Stack(
                    children:[
                      Text(
                        "Visualizing art \n in the City of Brea!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(textStyle:const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                      ),

                    ]),
              ),
            ),


            Container(
              width: 320,
              height:50,
              alignment: Alignment.center,
              child: Material(
                color:const Color(0xffFFB74D),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)),),
                child:Stack(
                    children:[
                      Text(
                        "An App by Gareth G. Waughan",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.raleway(textStyle:const TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                      ),

                    ]),
              ),
            ),


/*            Text(
              'An app by Gareth G. Waughan',
              style: TextStyle(backgroundColor:Colors.black, color: Colors.blueAccent, fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),*/


          ],
        ),

      ),

      floatingActionButton:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: _GotoInfoDialog,
              tooltip: 'Info about App!',
              child: const Icon(Icons.info),
              backgroundColor: const Color(0xffFFB74D),
              heroTag: "btnInfo",
            ),

            SizedBox(width: 30),

            FloatingActionButton(
              onPressed: _GotoGISMap,
              tooltip: 'Lets Go to Brea!',
              child: const Icon(Icons.map),
              backgroundColor: const Color(0xffFFB74D),
              heroTag: "btnMap",
            ),
          ],
        ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    ),
      ],
    );
  }
}
