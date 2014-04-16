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

@test "shows help when given no options" {
  run $rr

  echo $output | grep "Usage:"
  echo $output | grep -v `date '+%Y'`
  [ $status -eq 1 ]
}

@test "shows help when -h is passed" {
  run $rr -h

  echo $output | grep "Usage:"
  echo $output | grep -v `date '+%Y'`
  [ $status -eq 0 ]
}
