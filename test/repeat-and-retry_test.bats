load test_helper

@test "shows the current time before each command" {
  run $repeat_and_retry true

  [ $status -eq 0 ]

  echo $output | grep `date '+%Y'`
}

@test "allows the user to override the default sleep setting" {
  run $repeat_and_retry -n 0 true

  [ $status -eq 0 ]
}
