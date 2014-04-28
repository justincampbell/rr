load test_helper

@test "shows the current time before each command" {
  stub date
  run $rr true

  verify_called date
  [ $status -eq 0 ]
}

@test "does not show the current time when -q is passed" {
  stub date
  run $rr -q true

  verify_not_called date
  [ $status -eq 0 ]
}

@test "limits how many times the command is run when -c is passed" {
  run $rr -c 3 -n 0 false

  echo "$output" | wc -l | grep 3
}

@test "override the default sleep setting when -n is passed" {
  run time $rr -n 0 true

  echo $output | grep -v "1\."
  [ $status -eq 0 ]
}

@test "clears the screen before each command run when -r is passed" {
  stub clear

  run $rr -r true

  verify_called clear
  [ $status -eq 0 ]
}

@test "shows help when given no options" {
  stub date
  run $rr

  echo $output | grep "Options:"
  verify_not_called date
  [ $status -eq 1 ]
}

@test "shows help when -h is passed" {
  stub date
  run $rr -h

  echo $output | grep "Options:"
  verify_not_called date
  [ $status -eq 0 ]
}

@test "supports commands with spaces" {
  run $rr -q true 123

  [ "$output" = "" ]
  [ $status -eq 0 ]
}
