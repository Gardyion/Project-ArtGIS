import 'package:flutter/material.dart';
import 'package:flutter_map_arcgis/flutter_map_arcgis.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:google_fonts/google_fonts.dart';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('City of Brea',
            style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.orange),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [

              Flexible(
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(33.91828, -117.89947),
                    zoom: 16.0,
                    plugins: [EsriPlugin()],
                    //rotation: 2.0,
                    bounds: LatLngBounds(LatLng(33.911987,-117.905972), LatLng(33.925481,-117.893722)),
                    maxBounds: LatLngBounds(LatLng(33.810796,-117.949159), LatLng(34.030164,-117.760332)),
                  ),
                  layers: [
                    TileLayerOptions(
                     // urlTemplate:
                     // 'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',

                       urlTemplate: 'https://services.arcgisonline.com/arcgis/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
                      subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
                      maxNativeZoom: 17.0,
                      maxZoom: 17.0,
                    ),

                    FeatureLayerOptions(
                      "https://services3.arcgis.com/NaFf4UaPo3IgQXqn/arcgis/rest/services/Brea_Arts_V2_WFL1/FeatureServer/0",
                      "point",
                      render:(dynamic attributes){
                        // You can render by attribute
                        return PointOptions(
                          width: 120.0,
                          height: 30.0,

                          builder:

                            Container(
                              //alignment: Alignment.centerRight,
                              //color: Colors.orange,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget> [
                                    SizedBox(width: 30),

                                    IconButton(onPressed: (){
                                        print("Pressed");

                                        showGeneralDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            barrierLabel: MaterialLocalizations.of(context)
                                                .modalBarrierDismissLabel,
                                            barrierColor: Colors.black45,
                                            transitionDuration: const Duration(milliseconds: 200),
                                            pageBuilder: (BuildContext buildContext,
                                                Animation animation,
                                                Animation secondaryAnimation) {

                                              return Stack(
                                                children: <Widget>[
                                              Image.asset(
                                              "assets/dialog_bg.jpg",
                                                height: MediaQuery.of(context).size.height,
                                                width: MediaQuery.of(context).size.width,
                                                fit: BoxFit.cover,
                                                //opacity: const AlwaysStoppedAnimation(.5),
                                              ),

                                               Center(
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width - 10,
                                                  height: MediaQuery.of(context).size.height -  25,
                                                  padding: EdgeInsets.all(20),
                                                  color: Colors.transparent,
                                                  child: Column(
                                                    children: [

                                                      SizedBox(height: 20),

                                                      Material(
                                                        color: Colors.transparent,
                                                       // borderRadius: BorderRadius.circular(5),
                                                        child:Stack(
                                                            children:[
                                                              Text(
                                                                attributes["NameOfArt"],
                                                                textAlign: TextAlign.center,
                                                                // style: const TextStyle(color: Colors.black, fontSize: 20, fontFamily: "Century Gothic")
                                                                // style: GoogleFonts.roboto(textStyle:const TextStyle(color: Colors.black, fontSize: 20)),
                                                                style: GoogleFonts.acme(textStyle: TextStyle(foreground: Paint()
                                                                  ..style = PaintingStyle.stroke
                                                                  ..strokeWidth = 4
                                                                  ..color = Colors.white,
                                                                    fontSize: 40)),
                                                              ),
                                                              Text(
                                                                attributes["NameOfArt"],
                                                                textAlign: TextAlign.center,
                                                                // style: const TextStyle(color: Colors.black, fontSize: 20, fontFamily: "Century Gothic")
                                                                // style: GoogleFonts.roboto(textStyle:const TextStyle(color: Colors.black, fontSize: 20)),
                                                                style: GoogleFonts.acme(textStyle:const TextStyle(color: const Color(0xff9400D3), fontSize: 40)),
                                                              ),

                                                              ]),
                                                      ),

                                                      SizedBox(height: 10),

                                                      Expanded(
                                                        child:
                                                              Container(
                                                                width: 250,
                                                                height: 400,
                                                                //color: Colors.black,
                                                              decoration: BoxDecoration(
                                                                border: Border.all(width: 5),
                                                              ) ,
                                                              child: Image(image: NetworkImage(attributes["PictureLink"],
                                                                // scale: 2.0
                                                              ),
                                                                width:250,
                                                                height: 400,
                                                                fit: BoxFit.fill,
                                                              ),
                                                              ),
                                                      ),


                                                      SizedBox(height: 10),

                                                      Material(
                                                        color: Colors.transparent, // <-- Add this, if needed
                                                        child: Stack(
                                                            children:[
                                                              Text(
                                                                attributes["Artist"],
                                                                textAlign: TextAlign.center,
                                                                style: GoogleFonts.jost(textStyle: TextStyle(foreground: Paint()
                                                                  ..style = PaintingStyle.stroke
                                                                  ..strokeWidth = 2
                                                                  ..color = Colors.black,
                                                                    fontSize: 30)),
                                                              ),
                                                              Text(
                                                                attributes["Artist"],
                                                                textAlign: TextAlign.center,
                                                                style: GoogleFonts.jost(textStyle:const TextStyle(color: const Color(0xffE49B0F), fontSize: 30)),
                                                              ),

                                                            ]) /*Text(
                                                            attributes["Artist"],
                                                            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
                                                        ),*/
                                                      ),

                                                      SizedBox(height: 20),

                                                      Material(
                                                        color: Colors.transparent, // <-- Add this, if needed
                                                        child: Stack(
                                                            children:[
                                                              Text(
                                                                attributes["Location"],
                                                                textAlign: TextAlign.center,
                                                                style: GoogleFonts.redHatDisplay(textStyle: TextStyle(foreground: Paint()
                                                                  ..style = PaintingStyle.stroke
                                                                  ..strokeWidth = 1
                                                                  ..color = Colors.white,
                                                                    fontSize: 25, fontWeight: FontWeight.bold)),
                                                              ),
                                                              Text(
                                                                attributes["Location"],
                                                                textAlign: TextAlign.center,
                                                                style: GoogleFonts.redHatDisplay(textStyle:const TextStyle(
                                                                    color: const Color(0xff23196F),
                                                                    fontSize: 25, fontWeight: FontWeight.bold)),
                                                              ),

                                                            ])



                                                        /*Text(
                                                            attributes["Location"],
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)
                                                        ),*/
                                                      ),

                                                      SizedBox(height: 20),

                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        style: ElevatedButton.styleFrom(
                                                            backgroundColor: const Color(0xFFFF9800),
                                                            padding: EdgeInsets
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


                                      },
                                        icon: Icon(
                                          Icons.travel_explore_rounded,
                                          color: Colors.amber,
                                          size: 20.0),
                                      ),
                                    Expanded(
                                        flex: 1,
                                        child:Text(attributes["NameOfArt"],
                                          style: TextStyle(fontSize: 5.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              backgroundColor: Colors.black),
                                        textAlign: TextAlign.left,)
                                     ),





                                  ],


                                ))


                        );
                      },
                      onTap: (attributes, LatLng location) {
                        print(attributes);
                        print(location);




                      },
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}