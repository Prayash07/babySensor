class PageContent {
  String name;
  String image;

  PageContent({this.name, this.image});

  factory PageContent.fromJson(Map<String, dynamic> data) {
    if (data['image'] == null) data['image'] = "";
    return PageContent(
      name: data['text'],
      image: data['image'],
    );
  }
}
