import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String apiLink = 'https://reqres.in/api/users/2';
  Map? mapResponse;
  Future apiIntegration() async {
    http.Response response;
    response = await http.get(Uri.parse(apiLink));
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        print(mapResponse);
      });
    } else {
      return null;
    }
  }

  @override
  void initState() {
    apiIntegration();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Data from net'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const Text(
              'Api Integration',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 24),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue,
              ),
              child: Center(
                child: mapResponse == null
                    ? SizedBox(
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                'Data is Loading..',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            // CachedNetworkImage(
                            //   imageUrl: mapResponse!['data']['avatar'].toString(),
                            //   imageBuilder: (context, imageProvider) => Container(
                            //     height: 150,
                            //     width: 150,
                            //     decoration: BoxDecoration(
                            //       image: DecorationImage(
                            //           image: imageProvider,
                            //           fit: BoxFit.cover,
                            //           colorFilter: const ColorFilter.mode(
                            //               Colors.red, BlendMode.colorBurn)),
                            //     ),
                            //   ),
                            //   placeholder: (context, url) =>
                            //       const CircularProgressIndicator(),
                            //   errorWidget: (context, url, error) =>
                            //       const Icon(Icons.error),
                            // ),
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                    image: NetworkImage(mapResponse!['data']
                                            ['avatar']
                                        .toString()),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              mapResponse!['data']['first_name'].toString() +
                                  ' ' +
                                  mapResponse!['data']['last_name'].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              mapResponse!['data']['email'].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
