// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart';

class DataResponse {
  final String name;
  final String unit;
  final double value;
  final String type;

  String getName() {
    return name;
  }

  String getUnit() {
    return unit;
  }

  double getValue() {
    return value;
  }

  String getType() {
    return type;
  }

  DataResponse({
    required this.name,
    required this.unit,
    required this.value,
    required this.type,
  });

  factory DataResponse.fromJson(Map<String, dynamic> json) {
    return DataResponse(
      name: json['name'],
      unit: json['unit'],
      value: json['value'],
      type: json['type'],
    );
  }
}

Future<DataResponse> fetchDataResponse() async {
  final response = await http
      .get(Uri.parse('https://api.coingecko.com/api/v3/exchange_rates'));

  if (response.statusCode == 200) {
    return DataResponse.fromJson(jsonDecode(response.body)["rates"]["btc"]);

    // return jsonDecode(response.body);

    // var jsonData = response.body;
    // var parsedData = json.decode(jsonData);
    // stderr.writeln(jsonData);
    // developer.log(jsonData);
  } else {
    throw Exception('Failed to load data');
  }
}

void iterateJson(String jsonStr) {
  Map<String, dynamic> myMap = json.decode(jsonStr)["rates"];
  // List<dynamic> ratesDatas = myMap["rates"];
  print("\n____________________________________________________");
  // ratesDatas.forEach((ratesData) {
  //   (ratesData as Map<String, dynamic>).forEach((key, value) {
  //     print(key);
  //     (value as Map<String, dynamic>).forEach((key2, value2) {
  //       print(key2);
  //       print(value2);
  //     });
  //   });
  // });

  myMap.forEach((key, value) {
    print(key);
    value.forEach((key2, value2) {
      print(key2);
      print(value2);
    });
  });
  var keys = myMap.keys.toList();
  // var val = myMap[keys[idx]];
  print("\n____________________________________________________");
  // print(myMap["rates"]);
}

void iterateJsonSOF(String jsonStr) {
  Map<String, dynamic> myMap = json.decode(jsonStr)["rates"];

  Map<String, dynamic> ratesDatas = myMap;
  ratesDatas.forEach((key, value) {
    (value as Map<String, dynamic>).forEach((key, value) {
      print(key);
      (value as Map<String, dynamic>).forEach((key2, value2) {
        print(key2);
        print(value2);
      });
    });
  });
}

Future<Map<String, dynamic>> example() async {
  var url = Uri.parse('https://api.coingecko.com/api/v3/exchange_rates');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonData = response.body;
    // var parsedData = json.decode(jsonData);
    // print(jsonData);
    // iterateJson(jsonData);

    Map<String, dynamic> myMap = json.decode(jsonData)["rates"];

    // print(myMap);

    return myMap;

    // stderr.writeln();
    // developer.log(parsedData);
  } else {
    throw Exception('Failed to load data');
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // example();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Priananda Azhar',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: const Color.fromARGB(255, 63, 69, 88),
      ),
      home: const MyHomePage(title: 'Priananda Azhar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double screenHeight, screenWidth;

  late Future<DataResponse> dataResponse;

  late DataResponse response;

  Future<Map<String, dynamic>> responseMap = example();

  @override
  void initState() {
    super.initState();

    // dataResponse = fetchDataResponse();
    // ignore: avoid_print
    // print(dataResponse);
    // print(dataResponse);

    // fetchDataResponse();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    List<List<Color>> gradientColorforCard = [
      [
        Color.fromARGB(255, 79, 45, 230),
        Color.fromARGB(255, 0, 24, 204),
      ],
      [
        Color.fromARGB(255, 65, 110, 207),
        Color.fromARGB(255, 27, 79, 192),
      ],
      [
        Color.fromARGB(255, 241, 39, 120),
        Color.fromARGB(255, 196, 12, 200),
      ],
      [
        Color.fromARGB(255, 192, 181, 27),
        Color.fromARGB(255, 189, 115, 31),
      ],
    ];

    List<List<Color>> gradientColorShadowforCard = [
      [Color.fromARGB(107, 6, 58, 189)],
      [Color.fromARGB(107, 6, 58, 189)],
      [Color.fromARGB(19, 143, 13, 65)],
      [Color.fromARGB(107, 99, 87, 8)],
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: const Color.fromARGB(255, 42, 49, 72),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("assets/images/bulb.jpg"),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: Column(children: [
              Container(
                child: const Text(
                  "BTC\nExchange Rates\nViewer",
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      height: 1.4,
                      color: Colors.white),
                ),
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(0, 45, 0, 0),
                padding: const EdgeInsets.all(20),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(5, 45, 5, 0),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(15, 40, 15, 40),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    color: Color.fromARGB(255, 43, 47, 64),
                  ),
                  child: Column(children: [
                    //                                  CRYPTO
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Column(children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: const Text(
                              "Crypto",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 270,
                            decoration: BoxDecoration(
                                border: Border(
                              top: BorderSide(
                                  width: 1.0,
                                  color: Color.fromARGB(255, 85, 96, 101)),
                              bottom: BorderSide(
                                  width: 1.0,
                                  color: Color.fromARGB(255, 71, 82, 86)),
                            )),
                            child: ListView(
                              children: <Widget>[
                                /////////////////////////////////////////////////////////////////////////////////////
                                Container(
                                  // height: 50,
                                  // color: Colors.amber[600],
                                  child: Row(
                                    children: [
                                      Container(
                                          child: Image.network(
                                            'https://cryptologos.cc/logos/thumbs/bitcoin.png?v=022',
                                            width: 35,
                                            height: 35,
                                          ),
                                          padding: const EdgeInsets.all(7),
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 233, 233, 233),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(100),
                                                topLeft: Radius.circular(100),
                                                bottomLeft:
                                                    Radius.circular(100),
                                                bottomRight:
                                                    Radius.circular(100),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      50, 46, 46, 46),
                                                  spreadRadius: 4,
                                                  blurRadius: 20,
                                                ),
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      20, 40, 40, 40),
                                                  spreadRadius: -4,
                                                  blurRadius: 10,
                                                )
                                              ])),
                                      Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              10, 0, 0, 0),
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                // alignment: Alignment.centerLeft,
                                                // width: 100,
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 12),
                                                child: const Text(
                                                  'BitCoin',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Container(
                                                // alignment: Alignment.centerLeft,

                                                child: Row(children: [
                                                  Container(
                                                    color: Color.fromARGB(
                                                        255, 64, 64, 64),
                                                    padding: EdgeInsets.all(7),
                                                    child: const Text(
                                                      'BTC',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(10, 0, 0, 0),
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 5, 10, 5),
                                                    child: const Text(
                                                      '3483034.665',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.white),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          167, 13, 255, 186),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(10),
                                                        topLeft:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(10),
                                                      ),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color: Color.fromARGB(
                                                              50, 46, 46, 46),
                                                          spreadRadius: 4,
                                                          blurRadius: 20,
                                                        ),
                                                        BoxShadow(
                                                          color: Color.fromARGB(
                                                              20, 40, 40, 40),
                                                          spreadRadius: -4,
                                                          blurRadius: 10,
                                                        )
                                                      ],
                                                      border: Border.all(
                                                          color: Color.fromARGB(
                                                              195,
                                                              142,
                                                              218,
                                                              143),
                                                          width: 2),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(10, 0, 0, 0),
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 5, 10, 5),
                                                    child: const Text(
                                                      'Crypto',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.white),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          167, 255, 65, 13),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(10),
                                                        topLeft:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(10),
                                                      ),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color: Color.fromARGB(
                                                              77, 57, 29, 4),
                                                          spreadRadius: 4,
                                                          blurRadius: 20,
                                                        ),
                                                        BoxShadow(
                                                          color: Color.fromARGB(
                                                              115, 62, 6, 6),
                                                          spreadRadius: -4,
                                                          blurRadius: 10,
                                                        )
                                                      ],
                                                      border: Border.all(
                                                          color: Color.fromARGB(
                                                              199, 239, 72, 0),
                                                          width: 2),
                                                    ),
                                                  )
                                                ]),
                                              )
                                            ],
                                          )),
                                      // Spacer(),
                                      // Container(
                                      //     padding: EdgeInsets.all(2),
                                      //     width: 150,
                                      //     height: 50,
                                      //     alignment: Alignment.centerRight,
                                      //     decoration: BoxDecoration(
                                      //       color:
                                      //           Color.fromARGB(121, 0, 255, 119),
                                      //       borderRadius: BorderRadius.only(
                                      //         topRight: Radius.circular(10),
                                      //         topLeft: Radius.circular(10),
                                      //         bottomLeft: Radius.circular(10),
                                      //         bottomRight: Radius.circular(10),
                                      //       ),
                                      //       boxShadow: const [
                                      //         BoxShadow(
                                      //           color: Color.fromARGB(
                                      //               50, 46, 46, 46),
                                      //           spreadRadius: 4,
                                      //           blurRadius: 20,
                                      //         ),
                                      //         BoxShadow(
                                      //           color: Color.fromARGB(
                                      //               20, 40, 40, 40),
                                      //           spreadRadius: -4,
                                      //           blurRadius: 10,
                                      //         )
                                      //       ],
                                      //       border: Border.all(
                                      //           color: Color.fromARGB(
                                      //               195, 142, 218, 143),
                                      //           width: 2),
                                      //     ),
                                      //     child: Center(
                                      //       child: const Text(
                                      //         '432.453.343',
                                      //         style: TextStyle(
                                      //             fontSize: 16,
                                      //             fontWeight: FontWeight.normal,
                                      //             color: Colors.white),
                                      //       ),
                                      //     ))
                                    ],
                                  ),
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 20, 15, 20),
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 10),
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color.fromARGB(255, 79, 45, 230),
                                          Color.fromARGB(255, 0, 24, 204),
                                        ],
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(107, 6, 58, 189),
                                          spreadRadius: 4,
                                          blurRadius: 20,
                                        ),
                                      ]),
                                ),
                                /////////////////////////////////////////////////////////////////////////
                                Container(
                                  // height: 50,
                                  // color: Colors.amber[600],
                                  child: Row(
                                    children: [
                                      Container(
                                          child: Image.network(
                                            'https://cryptologos.cc/logos/thumbs/bitcoin.png?v=022',
                                            width: 35,
                                            height: 35,
                                          ),
                                          padding: const EdgeInsets.all(7),
                                          decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 233, 233, 233),
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(100),
                                                topLeft: Radius.circular(100),
                                                bottomLeft:
                                                    Radius.circular(100),
                                                bottomRight:
                                                    Radius.circular(100),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      50, 46, 46, 46),
                                                  spreadRadius: 4,
                                                  blurRadius: 20,
                                                ),
                                                BoxShadow(
                                                  color: Color.fromARGB(
                                                      20, 40, 40, 40),
                                                  spreadRadius: -4,
                                                  blurRadius: 10,
                                                )
                                              ])),
                                      Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              10, 0, 0, 0),
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                // alignment: Alignment.centerLeft,
                                                // width: 100,
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 12),
                                                child: const Text(
                                                  'BitCoin',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Container(
                                                // alignment: Alignment.centerLeft,

                                                child: Row(children: [
                                                  Container(
                                                    color: Color.fromARGB(
                                                        255, 64, 64, 64),
                                                    padding: EdgeInsets.all(7),
                                                    child: const Text(
                                                      'BTC',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(10, 0, 0, 0),
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 5, 10, 5),
                                                    child: const Text(
                                                      '3483034.665',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.white),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          167, 13, 255, 186),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(10),
                                                        topLeft:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(10),
                                                      ),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color: Color.fromARGB(
                                                              50, 46, 46, 46),
                                                          spreadRadius: 4,
                                                          blurRadius: 20,
                                                        ),
                                                        BoxShadow(
                                                          color: Color.fromARGB(
                                                              20, 40, 40, 40),
                                                          spreadRadius: -4,
                                                          blurRadius: 10,
                                                        )
                                                      ],
                                                      border: Border.all(
                                                          color: Color.fromARGB(
                                                              195,
                                                              142,
                                                              218,
                                                              143),
                                                          width: 2),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .fromLTRB(10, 0, 0, 0),
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 5, 10, 5),
                                                    child: const Text(
                                                      'Crypto',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.white),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          167, 255, 65, 13),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(10),
                                                        topLeft:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(10),
                                                      ),
                                                      boxShadow: const [
                                                        BoxShadow(
                                                          color: Color.fromARGB(
                                                              77, 57, 29, 4),
                                                          spreadRadius: 4,
                                                          blurRadius: 20,
                                                        ),
                                                        BoxShadow(
                                                          color: Color.fromARGB(
                                                              115, 62, 6, 6),
                                                          spreadRadius: -4,
                                                          blurRadius: 10,
                                                        )
                                                      ],
                                                      border: Border.all(
                                                          color: Color.fromARGB(
                                                              199, 239, 72, 0),
                                                          width: 2),
                                                    ),
                                                  )
                                                ]),
                                              )
                                            ],
                                          )),
                                      //
                                    ],
                                  ),
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 20, 15, 20),
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 10),
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color.fromARGB(255, 65, 110, 207),
                                          Color.fromARGB(255, 27, 79, 192),
                                        ],
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(107, 6, 58, 189),
                                          spreadRadius: 4,
                                          blurRadius: 20,
                                        ),
                                      ]),
                                ),
                                Container(
                                  height: 50,
                                  // color: Colors.amber[600],
                                  child: const Center(
                                      child: Text(
                                    'Entry A',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  )),
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 10),
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      // color: Color.fromARGB(255, 41, 99, 250),
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color.fromARGB(255, 241, 39, 120),
                                          Color.fromARGB(255, 196, 12, 200),
                                        ],
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(19, 143, 13, 65),
                                          spreadRadius: 4,
                                          blurRadius: 50,
                                        ),
                                      ]),
                                ),
                                Container(
                                  height: 50,
                                  // color: Colors.amber[600],
                                  child: const Center(
                                      child: Text(
                                    'Entry A',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  )),
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 5, 0, 10),
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        topLeft: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      color: Color.fromARGB(255, 41, 99, 250),
                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color.fromARGB(255, 192, 181, 27),
                                          Color.fromARGB(255, 189, 115, 31),
                                        ],
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(107, 99, 87, 8),
                                          spreadRadius: 4,
                                          blurRadius: 20,
                                        ),
                                      ]),
                                ),
                              ],
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                            ),
                          ),

                          ////////////////////////////////////////////////////////////////////
                        ])),
                    Container(
                        //                                  FIAT
                        alignment: Alignment.centerLeft,
                        child: Column(children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                            child: const Text(
                              "Fiat",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                          ListView(
                            children: <Widget>[
                              Container(
                                height: 50,
                                // color: Colors.amber[600],
                                child: const Center(
                                    child: Text(
                                  'Entry A',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                )),
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    color: Color.fromARGB(255, 41, 99, 250),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(107, 25, 80, 219),
                                        spreadRadius: 4,
                                        blurRadius: 20,
                                      ),
                                      BoxShadow(
                                        color: Color.fromARGB(107, 17, 47, 123),
                                        spreadRadius: -4,
                                        blurRadius: 10,
                                      )
                                    ]),
                              ),
                              Container(
                                height: 50,
                                // color: Colors.amber[600],
                                child: const Center(
                                    child: Text(
                                  'Entry A',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                )),
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    color: Color.fromARGB(255, 41, 99, 250),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(107, 25, 80, 219),
                                        spreadRadius: 4,
                                        blurRadius: 20,
                                      ),
                                      BoxShadow(
                                        color: Color.fromARGB(107, 17, 47, 123),
                                        spreadRadius: -4,
                                        blurRadius: 10,
                                      )
                                    ]),
                              ),
                              Container(
                                height: 50,
                                // color: Colors.amber[600],
                                child: const Center(
                                    child: Text(
                                  'Entry A',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                )),
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    color: Color.fromARGB(255, 41, 99, 250),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(107, 25, 80, 219),
                                        spreadRadius: 4,
                                        blurRadius: 20,
                                      ),
                                      BoxShadow(
                                        color: Color.fromARGB(107, 17, 47, 123),
                                        spreadRadius: -4,
                                        blurRadius: 10,
                                      )
                                    ]),
                              ),
                            ],
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                          ), ////////////////////////////////////////////////////////////////////
                        ])),
                    Container(
                        //                                  COMMIDITY
                        alignment: Alignment.centerLeft,
                        child: Column(children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                            child: const Text(
                              "Commodity",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                          ListView(
                            children: <Widget>[
                              Container(
                                height: 50,
                                // color: Colors.amber[600],
                                child: const Center(
                                    child: Text(
                                  'Entry A',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                )),
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    color: Color.fromARGB(255, 41, 99, 250),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(107, 25, 80, 219),
                                        spreadRadius: 4,
                                        blurRadius: 20,
                                      ),
                                      BoxShadow(
                                        color: Color.fromARGB(107, 17, 47, 123),
                                        spreadRadius: -4,
                                        blurRadius: 10,
                                      )
                                    ]),
                              ),
                              Container(
                                height: 50,
                                // color: Colors.amber[600],
                                child: const Center(
                                    child: Text(
                                  'Entry A',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                )),
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    color: Color.fromARGB(255, 41, 99, 250),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(107, 25, 80, 219),
                                        spreadRadius: 4,
                                        blurRadius: 20,
                                      ),
                                      BoxShadow(
                                        color: Color.fromARGB(107, 17, 47, 123),
                                        spreadRadius: -4,
                                        blurRadius: 10,
                                      )
                                    ]),
                              ),
                              Container(
                                height: 50,
                                // color: Colors.amber[600],
                                child: const Center(
                                    child: Text(
                                  'Entry A',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white),
                                )),
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    color: Color.fromARGB(255, 41, 99, 250),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(107, 25, 80, 219),
                                        spreadRadius: 4,
                                        blurRadius: 20,
                                      ),
                                      BoxShadow(
                                        color: Color.fromARGB(107, 17, 47, 123),
                                        spreadRadius: -4,
                                        blurRadius: 10,
                                      )
                                    ]),
                              ),
                            ],
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                          ), ////////////////////////////////////////////////////////////////////
                        ])),
                  ])),
              Container(
                  // color: const Color.fromARGB(255, 43, 47, 64),
                  padding: EdgeInsets.all(20),
                  width: screenWidth,
                  height: 200,
                  // color: Color.fromARGB(255, 9, 44, 84),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Data provided from Coingecko API",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "UI made fully by priananda azhar",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ))),
                        Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
                              child: Text(
                                "Follow me on :",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              // color: Colors.amber,
                              child: Row(children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    color: Colors.deepOrange,
                                  ),
                                  child: IconButton(
                                    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                    icon: FaIcon(FontAwesomeIcons.instagram),
                                    color: Colors.white,
                                    onPressed: () async {
                                      const url =
                                          'https://instagram.com/azhar620';
                                      // ignore: deprecated_member_use
                                      if (await canLaunch(url)) {
                                        // ignore: deprecated_member_use
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                    color: Color.fromARGB(255, 51, 111, 181),
                                  ),
                                  child: IconButton(
                                    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                    icon: FaIcon(FontAwesomeIcons.github),
                                    color: Colors.white,
                                    onPressed: () async {
                                      const url =
                                          'https://github.com/Priananda620';
                                      // ignore: deprecated_member_use
                                      if (await canLaunch(url)) {
                                        // ignore: deprecated_member_use
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                                  ),
                                ),
                              ]),
                            )
                          ],
                        )),
                      ])
                  // margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  // child: ,
                  )
            ]),
            color: const Color.fromARGB(255, 32, 33, 44),
          ),
          // color: Colors.red.withOpacity(0.6),
          // height: screenHeight,
          // width: screenWidth,
        ),
      ),
    );
  }
}

// class coingeckoAPI {
//   Future<http.Response> fetchCoingecko() {
//     return http
//         .get(Uri.parse('https://api.coingecko.com/api/v3/exchange_rates'));
//   }

//   _loadWeather() async {}
// }
