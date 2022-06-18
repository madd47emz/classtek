class NewsModelView {
  String groupId;
  NewsModelView({required this.groupId});
  Future<String> postNewsToGroup() async {
    bool response = true;
    // await NewsRepo.getAllNews(groupId);
    if (response) {
      return "Sent to the According group";
    }
    return "Try again later";
  }
}
