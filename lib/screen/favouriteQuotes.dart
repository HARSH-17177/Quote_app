import 'package:flutter/material.dart';
import 'package:quote_app/constants/constant.dart';
import 'package:quote_app/preferences.dart';

class FavQuote extends StatefulWidget {
  const FavQuote({super.key});

  @override
  State<FavQuote> createState() => _FavQuoteState();
}

class _FavQuoteState extends State<FavQuote> {
  @override
  void initState() {
    favouritelist = UserSimplePreferences.getList() ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "tag3",
      child: Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('Favourite Quote'),
            GestureDetector(
                onTap: () {
                  setState(() {
                    favouritelist.clear();
                  });
                },
                child: const Icon(Icons.delete))
          ],
        )),
        body: ListView.builder(
            itemCount: favouritelist.length,
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
                                  favouritelist[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    favouritelist.remove(favouritelist[
                                        index]); //remove the quotes from the list
                                    favourcolor.remove(favourcolor[index]);
                                  });
                                },
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.black,
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
