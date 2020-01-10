#!/usr/bin/python
g1={'sll':0,'srl':1,'add':2,'sub':3,'and':4,'xnor':5,'div':6}
g2={'loadi':10}
g3={'jz':8,'jnz':9,'stop':15}
import sys, getopt,re
def translate(inputfile,outputfile):
    with open(outputfile,'w') as ofile:
        with open(inputfile,'r') as ifile:
            for line in ifile.readlines():
                line=line.split()
                if len(line)>0:
                    if line[0] in g1:
                        binary = group1(line)
                    if line[0] in g2:
                        binary = group2(line)
                    if line[0] in g3:
                        binary = group3(line)
                    binary = '%0*X' % ((len(binary) + 3) // 4, int(binary, 2))
                    ofile.write(binary.lower()+"\n")

def group1(instr):
    s=instr[1]
    a=instr[2]
    b=instr[3]
    if s[0] == '@' and a[0] == '@' and b[0] == '@':
        import re
        s=int(re.sub("\D", "", s))
        b=int(re.sub("\D", "", b))
        a=int(re.sub("\D", "", a))
    else:
        print('Wrong Format',instr)
    binary = "0000{0:b}".format(g1[instr[0]])[-4:]+ \
        "000{0:b}".format(s)[-4:]+"000{0:b}".format(a)[-4:]+"000{0:b}".format(b)[-4:]
    print(instr[0],"@"+str(s),"@"+str(a),"@"+str(b),
    '\t -> ',binary[0:4],binary[4:8],binary[8:12],binary[12:])
    return binary
def group2(instr):
    s=instr[1]
    imm=instr[2]
    if s[0] == '@':
        s=int(re.sub("\D", "", s))
        imm=int(re.sub("\D", "", imm))
    else:
        print('Wrong Format',instr)
    binary = "0000{0:b}".format(g2[instr[0]])[-4:]+ \
        "000{0:b}".format(s)[-4:]+"0000000{0:b}".format(imm)[-8:]
    print(instr[0],"@"+str(s),imm,'\t -> ',
        binary[0:4],binary[4:8],binary[8:12],binary[12:])
    return binary
def group3(instr):
    if instr[0]=='stop':
        binary = '1'*16
        print(instr[0],'\t\t -> ',binary[0:4],
            binary[4:8],binary[8:12],binary[12:])
        return binary
    a=instr[1]
    bpc=instr[2]
    if a[0] == '@':
        a=int(re.sub("\D", "", a))
        bpc=int(re.sub("\D", "", bpc))
    else:
        print('Wrong Format',instr)
    bpcBin="0000000{0:b}".format(bpc)[-8:]
    binary = "0000{0:b}".format(g3[instr[0]])[-4:] +\
         bpcBin[:-4] + "000{0:b}".format(a)[-4:]+bpcBin[-4:]
    print(instr[0],"@"+str(a),bpc,'\t -> ',
        binary[0:4],binary[4:8],binary[8:12],binary[12:])
    return binary
    
def main(argv):
   inputfile = ''
   outputfile = ''
   try:
      opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
   except getopt.GetoptError:
      print('convert.py -i <inputfile> -o <outputfile>')
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print('convert.py -i <inputfile> -o <outputfile>') 
         sys.exit()
      elif opt in ("-i", "--ifile"):
         inputfile = arg
      elif opt in ("-o", "--ofile"):
         outputfile = arg
   print('Input file is "', inputfile,'"')
   print('Output file is "', outputfile,'"')
   translate(inputfile,outputfile)
if __name__ == "__main__":
   main(sys.argv[1:])