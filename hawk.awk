/./ {  # ignore blank lines
  f = "hawk.temp"
  hist[++n] = "prev = " $0  # put user input into hist array
  print "BEGIN {" >f        # add begin statement to temp file
  for (i = 1; i <= n; i++)  # add all the user input into the temp file
    print hist[i] >f
  if ($0 !~ "=")            # print padded output 
    print "print \"   \" prev" >f
  print "}" >f
  close(f)                  # close temp file
  system("awk -f " f)       # run temp file
}