import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate<String> {
  List<String> searchTerms = ['courses', 'games', 'AI'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var alph in searchTerms) {
      if (alph.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(alph);
      }
    }

    // Build search results
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var alph in searchTerms) {
      if (alph.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(alph);
      }
    }

    // Build search suggestions
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
