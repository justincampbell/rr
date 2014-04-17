load test_helper

@test "shows the current time before each command" {
  run $rr true

  [ $status -eq 0 ]

  echo $output | grep `date '+%Y'`
}

@test "does not show the current time when -q is passed" {
  run $rr -q true

  [ $status -eq 0 ]

  echo $output | grep -v `date '+%Y'`
}

@test "allows the user to limit how many times the command is run" {
  run $rr -c 3 -n 0 false

  echo "$output" | wc -l | grep 3
}

@test "allows the user to override the default sleep setting" {
  run time $rr -n 0 true

  echo $output | grep -v "1\."
  [ $status -eq 0 ]
}

@test "shows help when given no options" {
  run $rr

  echo $output | grep "Options:"
  echo $output | grep -v `date '+%Y'`
  [ $status -eq 1 ]
}

@test "shows help when -h is passed" {
  run $rr -h

  echo $output | grep "Options:"
  echo $output | grep -v `date '+%Y'`
  [ $status -eq 0 ]
}
