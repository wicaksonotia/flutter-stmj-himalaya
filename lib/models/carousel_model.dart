class CarouselModel {
  String? photo;

  CarouselModel({this.photo});

  CarouselModel.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['photo'] = photo;
    return data;
  }
}
