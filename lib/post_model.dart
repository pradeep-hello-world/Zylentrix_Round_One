/// Represents a post retrieved from the API.
class Post {
  /// The ID of the user who created the post.
  final int userId;

  /// The unique ID of the post.
  final int id;

  /// The title of the post.
  final String title;

  /// The body/content of the post.
  final String body;

  /// Constructs a [Post] object with required parameters.
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  /// Factory method to create a [Post] instance from JSON data.
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'], // Extracts user ID
      id: json['id'], // Extracts post ID
      title: json['title'], // Extracts title
      body: json['body'], // Extracts body content
    );
  }
}
