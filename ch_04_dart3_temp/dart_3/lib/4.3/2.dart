void switcher(dynamic anything) {
  switch (anything) {
    case 'aaa':
      print('match: aaa');
      break;
    case [1, 2]:
      print('match: [1, 2]');
      break;
    case [_, _, _]:
      print('match [_,_,_]');
      break;
    case [int a, int b]:
      print('match: [int $a, int $b]');
      break;
    case (String a, int b):
      print('match: (String: $a, int: $b)');
      break;
    default:
      print('no match');
  }
}

void main() {
  switcher('aaa');
  switcher([1, 2]);
  switcher([3, 4, 5]);
  switcher([6, 7]);
  switcher(('민지', 19));
  switcher(8);
}
