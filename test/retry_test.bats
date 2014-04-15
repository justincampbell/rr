load test_helper

@test "retry runs a successful command once" {
  run $retry true

  [ $status -eq 0 ]
}

@test "retry runs a failing command until it succeeds" {
  sleep 0.01 && touch $RR_TMPDIR/foo &
  run $retry -n 0.01 cat $RR_TMPDIR/foo

  [ $status -eq 0 ]
}

@test "retry shows the current time before each command" {
  run $retry true

  [ $status -eq 0 ]

  echo $output | grep `date '+%Y'`
}

@test "retry allows the user to override the default sleep setting" {
  run $retry -n 0 true

  [ $status -eq 0 ]
}
