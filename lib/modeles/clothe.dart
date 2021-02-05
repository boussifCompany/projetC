class Clothe {
  final String type;
  final String color;
  final String brand;

  Clothe({this.type, this.color, this.brand});

  factory Clothe.fromJson(Map<String, dynamic> json) {
    return Clothe(
        type: json['type'], color: json['color'], brand: json['brand']);
  }

  // Convert object to json
  Map<String, dynamic> toJson() {
    return {'type': type, 'color': color, 'brand': brand};
  }

  @override
  bool operator ==(other) {
    return (other is Clothe) &&
        other.type == type &&
        other.color == color &&
        other.brand == brand;
  }

  int get hashCode => type.hashCode ^ color.hashCode ^ brand.hashCode;

  @override
  String toString() {
    return "type: ${type}, color: ${color}, brand: ${brand}";
  }
}
