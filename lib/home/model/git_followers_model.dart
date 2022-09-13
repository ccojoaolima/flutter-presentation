import 'dart:convert';

class GitHubFollowers {
  String login;
  String avatarUrl;
  String url;

  GitHubFollowers(
      {required this.login, required this.avatarUrl, required this.url});

  GitHubFollowers.fromJson(Map<String, dynamic> json)
      : avatarUrl = json['avatar_url'],
        login = json['login'],
        url = json['url'];

  static List<GitHubFollowers>? listGitFollowers(String source) {
    // List<Map<String, dynamic>> json) {
    final List json = jsonDecode(source);
    final List<GitHubFollowers> listItems = <GitHubFollowers>[];

    listItems.addAll(
      json.map(
        (e) => GitHubFollowers.fromJson(e),
      ),
    );

    return listItems;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['avatar_url'] = this.avatarUrl;
    data['url'] = this.url;
    return data;
  }
}
