source "$rvm_path/scripts/rvm"

rvm use 1.9.2 --install
rvm gemset create test_gemset

rvm alias create default 1.9.2@test_gemset # status=0
ls -l $rvm_path/environments/default       # status=0; match=/1.9.2.*@test_gemset/
rvm alias list                             # match=/^default => ruby-1.9.2.*@test_gemset$/
rvm alias delete default                   # status=0
ls -l $rvm_path/environments/default       # status!=0

rvm alias create ruby-test-default 1.9.2@test_gemset # status=0
ls -l $rvm_path/environments/ruby-test-default       # status!=0
rvm alias list                                       # match=/^ruby-test-default => ruby-1.9.2.*@test_gemset$/
rvm alias delete ruby-test-default                   # status=0

rvm --force gemset delete test_gemset
