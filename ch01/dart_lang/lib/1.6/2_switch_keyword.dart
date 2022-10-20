enum Status {
  approved,
  pending,
  rejected,
}

void main() {
  Status status = Status.approved;

  switch (status) {
    case Status.approved:
    // approved 값이기 때문에 다음 코드가 실행됩니다.
      print('승인 상태입니다.');
      break;
    case Status.pending:
      print('대기 상태입니다.');
      break;
    case Status.rejected:
      print('거절 상태입니다.');
      break;
    default:
      print('알 수 없는 상태입니다.');
  }

  // Enum의 values값은 Enum의 모든 수를 리스트로 반환합니다.
  print(Status.values);
}
