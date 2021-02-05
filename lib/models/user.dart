class User {
  String uid;
  String email;
  String name;
  String image;
  String bio;
  List<dynamic> skills;
  List<dynamic> links;
  int follower;
  int following;

  User(
      {this.uid,
      this.email,
      this.name,
      this.image,
      this.skills,
      this.links,
      this.bio,
      this.follower,
      this.following});
}
