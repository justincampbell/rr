load test_helper

@test "repeat runs a failing command once" {
  run $repeat false

  [ $status -eq 1 ]
}

@test "repeat runs a successful command until it fails" {
  run $repeat -n 0 mkdir $RR_TMPDIR/foo

  [ $status -eq 1 ]
}

@test "repeat bubbles up the same error code from failures" {
  run $repeat foobar

  [ $status -eq 127 ]
}

@test "repeat returns 0 when a count is reached" {
  run $repeat -c 2 -n 0 true

  [ $status -eq 0 ]
}
