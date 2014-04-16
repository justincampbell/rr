load test_helper

@test "shows the current time before each command" {
  run $rr true

  [ $status -eq 0 ]

  echo $output | grep `date '+%Y'`
}

@test "allows the user to override the default sleep setting" {
  run $rr -n 0 true

  [ $status -eq 0 ]
}

@test "bubbles up the same error code from failures" {
  run $rr -1 foobar

  [ $status -eq 127 ]
}
