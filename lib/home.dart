import 'package:flutter/material.dart';

import 'package:quote_app/constants/constant.dart';
import 'package:quote_app/preferences.dart';
import 'package:quote_app/search/searching.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "tag1",
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Quote App"),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: CustomSearchDelegate()); //used to search
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: (listResponse.isEmpty)
            ? const Center(
              child: CircularProgressIndicator(
                  color: Colors.blueAccent,
                ),
            )
            : ListView.builder(
                itemCount: listResponse.isEmpty ? 0 : listResponse.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Card(
                            elevation: 10,
                            shadowColor: Colors.greenAccent,
                            color: Colors.blue,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      listResponse[index]['content'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        favourcolor.add(index);

                                        favouritelist.add(
                                            listResponse[index]['content']);
                                      });
                                      await UserSimplePreferences.setList(
                                          favouritelist);
                                    },
                                    child: Icon(
                                      Icons.favorite,
                                      color: favourcolor.contains(index)
                                          ? Colors.pink
                                          : Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                    ],
                  );
                }),
      ),
    );
  }
}
