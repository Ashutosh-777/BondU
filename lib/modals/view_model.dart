class ViewModel {
  int? views;
  int? contacted;
  double? tapThroughRate;
  String? lastContactDate;
  ViewModel({
    required this.views,
    required this.contacted,
    required this.tapThroughRate,
    required this.lastContactDate
});

  factory ViewModel.fromJson(Map<String, dynamic> json) => ViewModel(
    views: json['views'],
    contacted: json['contacted'],
    lastContactDate: json['lastContactDate'],
    tapThroughRate: json['tapThroughRate'],
  );
}
