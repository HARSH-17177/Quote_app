import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quote_app/constants/constant.dart';
import 'package:quote_app/screen/Searchquotes.dart';
import 'package:quote_app/screen/favouriteQuotes.dart';
import 'package:quote_app/home.dart';
import 'package:http/http.dart' as http;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse(
        "https://api.quotable.io/search/quotes?query=life%20happiness"));
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
        mapResponse = jsonDecode(response.body);
        listResponse = mapResponse['results'];
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Author Quotes")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Starter(
            name: "Author Quotes",
            icon: Icons.book,
            color: Colors.pink,
            loc: const HomePage(),
            tags: "tag1",
          ),
          Starter(
            name: "Search Quotes",
            icon: Icons.search,
            color: Colors.yellow,
            loc: const SearchQuotes(),
            tags: "tag2",
          ),
          Starter(
            name: "Favourite Quotes",
            icon: Icons.favorite,
            color: Colors.cyanAccent,
            loc: const FavQuote(),
            tags: "tag3",
          ),
        ],
      ),
    );
  }
}

class Starter extends StatelessWidget {
  String name;
  IconData icon;
  Color color;
  var loc;
  String tags;
  Starter(
      {super.key,
      required this.icon,
      required this.name,
      required this.color,
      required this.loc,required this.tags});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => loc));
        },
        child: Hero(
          tag: tags,
          child: Container(
            decoration: BoxDecoration(color: color),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 80,
                ),
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
