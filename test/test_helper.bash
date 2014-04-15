setup() {
  RR_TMPDIR=$BATS_TMPDIR/rr

  rm -rf $RR_TMPDIR
  mkdir -p $RR_TMPDIR

  repeat=bin/repeat
  retry=bin/retry
  rr=bin/rr
}

teardown() {
  echo $output
}
