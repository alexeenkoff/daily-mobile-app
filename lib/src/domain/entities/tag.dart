import 'package:quiver/core.dart';

class Tag {
  final String text;
  final bool isChecked;

  Tag(this.text, this.isChecked);

  @override
  bool operator ==(other) {
    if (other is Tag) {
      if (other.text == this.text && other.isChecked == this.isChecked) {
        return true;
      }
      else
        return false;
    } else
      return false;
  }

  @override
  int get hashCode => hash2(text.hashCode, isChecked.hashCode);
}
