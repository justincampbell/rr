load test_helper

@test "repeat runs a failing command once" {
  run $repeat false

  [ $status -eq 1 ]
}

@test "repeat runs a successful command until it fails" {
  run $repeat -n 0 mkdir $RR_TMPDIR/foo

  [ $status -eq 1 ]
}

@test "repeat shows the current time before each command" {
  run $repeat false

  [ $status -eq 1 ]

  echo $output | grep `date '+%Y'`
}

@test "repeat allows the user to override the default sleep setting" {
  run $repeat -n 0 false

  [ $status -eq 1 ]
}
