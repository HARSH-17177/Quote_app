import 'package:flutter/material.dart';
import 'package:quote_app/constants/constant.dart';

List searchTerms = listResponse;

class CustomSearchDelegate extends SearchDelegate {
  //inside it we add 4 overides with differnet functions

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List matchQuery = [];

    for (int i = 0; i < listResponse.length; i++) {
      if (listResponse[i]['author']
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase())||
          listResponse[i]['content']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()) ||
          listResponse[i]['tags'][0]
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase())) {
        matchQuery.add(listResponse[i]['content']);
      }
    }

    return ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              elevation: 10,
              shadowColor: Colors.greenAccent,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  matchQuery[index],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ));
        },
        itemCount: matchQuery.length);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //same as build result
    List matchQuery = [];

    for (int i = 0; i < listResponse.length; i++) {
      if (listResponse[i]['author']
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase())||
          listResponse[i]['content']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()) ||
          listResponse[i]['tags'][0]
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase())) {
        matchQuery.add(listResponse[i]['content']);
      }
    }

    return ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              elevation: 10,
              shadowColor: Colors.greenAccent,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  matchQuery[index],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ));
        },
        itemCount: matchQuery.length);
  }
}
