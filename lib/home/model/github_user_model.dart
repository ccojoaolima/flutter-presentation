class GitHubUser {
  String login;
  String avatarUrl;
  String name;
  String location;
  String bio;
  String updatedAt;

  GitHubUser({
    required this.login,
    required this.avatarUrl,
    required this.name,
    required this.location,
    required this.bio,
    required this.updatedAt,
  });

  static GitHubUser getUser(Map<String, dynamic> json){
      return GitHubUser(
          login: json['login'],
          avatarUrl : json['avatar_url'],
          name : json['name'],
          location : json['location'],
          bio : json['bio'],
          updatedAt : json['updated_at'],
      );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['avatar_url'] = this.avatarUrl;
    data['name'] = this.name;
    data['location'] = this.location;
    data['bio'] = this.bio;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
