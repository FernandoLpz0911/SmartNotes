import 'package:firebase_auth/firebase_auth.dart';  // import authentication from firebase
import 'package:smart_notes/auth.dart'; // import our authentication code
import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  NotePage({Key? key}) : super(key : key);

  Widget _title() {
    return Expanded( // Allows the TextField to take up available space
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Notes', // "Search Notes"
          prefixIcon: const Icon(Icons.search), // Search icon
          border: InputBorder.none, // Remove default TextField border
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0), // Adjust padding
        ),
        onChanged: (text) {
          // Handle search input changes
          print('Search input: $text');
        }
      )
    );
  }

  // The search bar now includes the tag and account icons
  Widget _buildSearchBar(BuildContext context) {
    return Container(
      height: 40, // Adjust height as needed
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant, // Or a specific light/dark color
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      child: Row( // Use a Row to arrange children horizontally
        children: <Widget>[
          // Left-side icon (Tags)
          FilledButton(
            onPressed: () {
              // Action when tag icon is pressed
              print('Tags icon pressed from within search bar');
            },
            child: const Text('Tags'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: _buildSearchBar(context), 
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //_userUid(),
          ],
        ),
      ),
    );
  }
}
