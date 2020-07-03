#!/usr/bin/env python
import sys
x=int(sys.argv[1])
o=str(x)+" is "
n=13
while (n>=0):
    if (2**n<=x):
        x=x-2**n
        o=o+str(2**+n)+"+"
    n=n-1
print(str(o)[:-1])
