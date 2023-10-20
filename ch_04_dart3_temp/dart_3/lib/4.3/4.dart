void main() {
  (int a, int b) val = (1, -1);

  switch (val) {
    case (1, _) when val.$2 > 0:
      print('1, 2');
      break;
    default:
      print('default');
  }
}
