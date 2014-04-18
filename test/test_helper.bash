setup() {
  RR_TMPDIR=$BATS_TMPDIR/rr
  RR_STUBS=$RR_TMPDIR/stubs
  PATH=$RR_STUBS:$PATH

  rm -rf $RR_TMPDIR
  mkdir -p $RR_TMPDIR

  repeat=bin/repeat
  retry=bin/retry
  rr=bin/rr
}

teardown() {
  echo $status: $output
}

stub() {
  stub=$RR_STUBS/$1
  mkdir -p $RR_STUBS
  echo "#!/bin/bash" > $stub
  echo "echo $1 called" >> $stub
  chmod +x $stub
}

verify_called() {
  echo $output | grep "$1 called"
}

verify_not_called() {
  echo $output | grep -v "$1 called"
}
