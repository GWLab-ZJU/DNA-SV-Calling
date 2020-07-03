import sys
fh=open(sys.argv[1],"r")
for line in fh.readlines():
    print("")
    for char in line[0:-1]:
        print(str(ord(char)-33),end=',')
all='''!"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~'''
print(all)
for char in all:
    print(str(ord(char) - 33),end=',')
fh.close()
