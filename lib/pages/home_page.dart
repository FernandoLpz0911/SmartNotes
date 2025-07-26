import 'package:firebase_auth/firebase_auth.dart';  // import authentication from firebase
import 'package:smart_notes/auth.dart'; // import our authentication code
import 'package:flutter/material.dart';
import './note_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key : key);

  // set the user
  final User? user = Auth().currentUser;

  // function ability to sign out on homepage using out auth class's sign out
  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  Widget _newNote(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => NotePage()),
        );
      },
      child: const Icon(Icons.add),
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
          // Expanded TextField for the search input
          Expanded( // Allows the TextField to take up available space
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
              },
            ),
          ),
          // Right-side icon (Account)
          IconButton(
            icon: const Icon(Icons.account_circle), // Account icon
            onPressed: () {
              // Action when account icon is pressed
              print('Account icon pressed from within search bar');
            },
            tooltip: 'Profile',
            color: Theme.of(context).colorScheme.onSurfaceVariant, // Ensure visibility in dark mode
            constraints: const BoxConstraints(), // Remove default constraints of IconButton
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
            _signOutButton(),
            _newNote(context),
          ],
        ),
      ),
    );
  }
}
