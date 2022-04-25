import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}






//////////////////////
gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color.fromARGB(255, 79, 45, 230),
                                          Color.fromARGB(255, 0, 24, 204),
                                        ],
                                      ),



                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color.fromARGB(255, 65, 110, 207),
                                          Color.fromARGB(255, 27, 79, 192),
                                        ],
                                      ),


                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color.fromARGB(255, 241, 39, 120),
                                          Color.fromARGB(255, 196, 12, 200),
                                        ],
                                      ),


                                      gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color.fromARGB(255, 192, 181, 27),
                                          Color.fromARGB(255, 189, 115, 31),
                                        ],
                                      ),






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
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(107, 0, 46, 162),
                                          spreadRadius: -4,
                                          blurRadius: 10,
                                        )
                                      ]),
                                ),
                                /////////////////////////////////////////////////////////////////////////
                                ///
                                ///
                                ///
                                ///
                                ///
                                ///
                                ///
                                ///
                                ///
                                ///