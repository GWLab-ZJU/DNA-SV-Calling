#!/usr/bin/env python
import os
import sys


def powersof2(in_num: int):
    n = 13
    o = []
    while (n >= 0):
        po2 = 2 ** n
        if (po2 <= in_num):
            in_num -= po2
            o.append(po2)
        n = n - 1
    return o


class samstat:
    def __init__(self, Mainstr: str):
        self.Mainstr = Mainstr
        inlines = self.Mainstr.split('\t')
        self.QNAME = inlines[0]
        self.FLAG = int(inlines[1])
        self.FLAGS = powersof2(self.FLAG)
        self.ISSEC = 256 in self.FLAGS or 1024 in self.FLAGS or 2018 in self.FLAGS or 4 in self.FLAGS or not 2 in self.FLAGS
        self.ISP1 = 64 in self.FLAGS
        self.ISP2 = 128 in self.FLAGS
        self.chr = inlines[2]

    def __str__(self):
        return self.Mainstr

    def __repr__(self):
        return self.QNAME + ":" + str(self.FLAG) + '(' + ','.join([str(self.ISP1), str(self.ISP2), str(self.ISSEC)]) + ')'


class sampair:
    def __init__(self):
        self.P1 = None
        self.P1_sec = []
        self.P2 = None
        self.P2_sec = []
        self.QNAME = ''
        self.diffchr = False

    def add(self, P: samstat) -> int:
        ret_val = 1
        if self.QNAME == "":
            self.QNAME = P.QNAME
            self.__add(P)
            ret_val = 0
        elif self.QNAME != P.QNAME:
            if self.P1 != None and self.P2_sec != []:
                self.P2 = self.P2_sec[0]
            elif self.P2 != None and self.P1_sec != []:
                self.P1 = self.P1_sec[0]
            elif self.P1 == None and self.P2 == None and self.P1_sec != [] and self.P2_sec != []:
                self.P1 = self.P1_sec[0]
                self.P2 = self.P2_sec[0]
            if self.P1 == None and self.P2 == None:
                ret_val = 2
            else:
                self.diffchr = self.P1.chr != self.P2.chr
        else:
            self.__add(P)
            ret_val = 0
        fdlogh.write(str(ret_val) + "=" + self.__repr__() + "+" + P.__repr__()+","+str(self.diffchr)+'\n')
        return ret_val


    def __add(self, P: samstat):
        if P.ISP1:
            if P.ISSEC or self.P1 != None:
                self.P1_sec.append(P)
            else:
                self.P1 = P
        elif P.ISP2:
            if P.ISSEC or self.P2 != None:
                self.P2_sec.append(P)
            else:
                self.P2 = P

    def logstr(self):
        tmps = ''
        if self.P1 != None:
            tmps += '\t'.join([self.P1.QNAME, str(self.P1.FLAG), "P1", str(int(self.P1.ISSEC)), "1"]) + '\n'
        if self.P2 != None:
            tmps += '\t'.join([self.P2.QNAME, str(self.P2.FLAG), "P2", str(int(self.P2.ISSEC)), "1"]) + '\n'
        for tmpP in self.P1_sec:
            tmps = '\t'.join([tmpP.QNAME, str(tmpP.FLAG), "P1", "1", "0"]) + '\n'
        for tmpP in self.P2_sec:
            tmps = '\t'.join([tmpP.QNAME, str(tmpP.FLAG), "P2", "1", "0"]) + '\n'
        return tmps

    def outstr(self):
        if self.P1 != None and self.P2 != None:
            return '\n'.join([self.P1.Mainstr, self.P2.Mainstr]) + '\n'
        else:
            return ''

    def __str__(self):
        return self.QNAME

    def __repr__(self):
        return self.QNAME + '(' + ','.join([str(self.P1 == None), str(self.P2 == None), str(self.P1_sec == []), str(self.P2_sec == [])]) + ")+"


if len(sys.argv) < 2 or not os.path.isfile(sys.argv[0]):
    exit(1)
finh = open(sys.argv[1])
fouth = open(sys.argv[1] + ".converted.sam", "w")
fout_chrdiffh = open(sys.argv[1] + ".converted_chrdiff.sam", "w")
flogh = open(sys.argv[1] + ".converted.log", "w")
fdlogh = open(sys.argv[1] + ".converted.debug.log", "w")
line_num = 0
flogh.write('line\tQNAME\tFLAG\tWHICHPAIRED\tISSEC\tWIRTE\n')
fdlogh.write("AddReturnValue=self.QNAME(P1,P2,P1_sec,P2_sec,isdiffchr)+P.QNAME:P.FLAG(P.ISP1,P.ISP2),self.ISSEC\n")
tmpsp = sampair()
while 1:
    inline = finh.readline()
    if inline == '':
        break
    elif inline.startswith('@'):
        continue
    line_num += 1
    tmpstat = samstat(inline.strip())
    ret_val = tmpsp.add(tmpstat)
    if ret_val == 1:
        flogh.write(tmpsp.logstr())
        fouth.write(tmpsp.outstr())
        if tmpsp.diffchr:
            fout_chrdiffh.write(tmpsp.outstr())
        tmpsp = sampair()
        tmpsp.add(tmpstat)
    elif ret_val == 2:
        flogh.write(tmpsp.logstr())
        tmpsp = sampair()
        tmpsp.add(tmpstat)
finh.close()
fdlogh.close()
flogh.write(tmpsp.logstr())
fouth.write(tmpsp.outstr())
if tmpsp.diffchr:
    fout_chrdiffh.write(tmpsp.outstr())
flogh.close()
fouth.close()
fout_chrdiffh.close()
