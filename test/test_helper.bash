setup() {
  RR_TMPDIR=$BATS_TMPDIR/rr

  rm -rf $RR_TMPDIR
  mkdir -p $RR_TMPDIR

  repeat_and_retry=bin/repeat-and-retry
  repeat=bin/repeat
  retry=bin/retry
}

teardown() {
  echo $output
}
