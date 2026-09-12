class Phone {
  String _id;
  String _name;
  String _description;
  double _price;
  String _imagePath;

  Phone({
    required String id,
    required String name,
    required String description,
    required double price,
    required String imagePath,
  })  : _id = id,
        _name = name,
        _description = description,
        _price = price,
        _imagePath = imagePath;

  String get getId => _id;
  String get getName => _name;
  String get getDescription => _description;
  double get getPrice => _price;
  String get getImagePath => _imagePath;
}
