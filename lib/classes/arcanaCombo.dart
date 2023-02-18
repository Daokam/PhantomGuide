class ArcanaCombo {
  List<String> sources;
  String result;

  ArcanaCombo({required this.sources, required this.result});

  factory ArcanaCombo.fromJson(Map<String, dynamic> json) {
    List<String> sources = [];
    for (var elem in json['source']) {
      sources.add(elem);
    }
    return ArcanaCombo(sources: sources, result: json['result']);
  }
}
