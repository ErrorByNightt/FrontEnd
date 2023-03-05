class ItemModel {
  final String name;
  final String icon;
  final String value;
  bool accepting;

  ItemModel(
      {required this.name,
      this.accepting = false,
      required this.icon,
      required this.value});
}
