import 'package:flutter/material.dart';
import 'package:quote_app/constants/constant.dart';
import 'package:quote_app/search/searching.dart';

List searchTerms = listResponse;


class SearchQuotes extends StatefulWidget {
  const SearchQuotes({super.key});

  @override
  State<SearchQuotes> createState() => _SearchQuotesState();
}

class _SearchQuotesState extends State<SearchQuotes> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "tag2",
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SearchBar'),
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
      ),
    );
  }
}

