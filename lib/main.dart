import 'dart:convert';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'post_model.dart';

/// Fetches a list of posts from the API.
/// Returns a list of `Post` objects if successful, otherwise throws an exception.
Future<List<Post>> fetchPosts() async {
  final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    // Decode JSON response and convert to a list of Post objects
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => Post.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load posts'); // Handle error response
  }
}

/// Entry point of the Flutter application.
void main() {
  runApp(const MyApp());
}

/// The root widget of the application.
///
/// It sets up the MaterialApp and directs the user to the `HomePage`.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Hides debug banner
      home: HomePage(), // Sets `HomePage` as the initial screen
    );
  }
}

/// Home screen widget that displays a list of posts fetched from an API.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

/// The state class for `HomePage`.
///
/// This class manages the API call and displays the fetched posts.
class _HomePageState extends State<HomePage> {
  late Future<List<Post>> futurePost; // Stores fetched posts

  @override
  void initState() {
    super.initState();
    futurePost = fetchPosts(); // Fetch posts when widget initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')), // App bar with title
      body: FutureBuilder<List<Post>>( // Asynchronous data fetching
        future: futurePost,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Show loading indicator
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Show error message
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available')); // Handle empty data
          } else {
            return ListView.builder( // Displays posts in a list
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final post = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(20), // Adds spacing around ListTile
                  child: ListTile(
                    title: Text(
                      post.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    subtitle: Text(
                      post.body,
                      style: const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    leading: CircleAvatar(
                      child: Text(post.id.toString()), // Displays post ID in a circle
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    tileColor: Colors.grey[100], // Background color for the tile
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // Rounded corners
                      side: BorderSide(color: Colors.grey.shade300), // Border color
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
