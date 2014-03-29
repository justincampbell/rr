load test_helper

@test "retry runs a successful command once" {
  run $retry true

  [ $status -eq 0 ]
}

@test "retry runs a failing command until it succeeds" {
  sleep 1 && touch $RR_TMPDIR/foo &
  run $retry cat $RR_TMPDIR/foo

  [ $status -eq 0 ]
}

@test "retry shows the current time before each command" {
  run $retry true

  [ $status -eq 0 ]

  echo $output | grep `date '+%Y'`
}
