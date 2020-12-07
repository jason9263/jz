# filepath = 'idl.txt'
# outF = open("diff.txt", "w")
#
# with open(filepath) as fp:
#    line = fp.readline()
#    cnt = 1
#    while line:
#         line = fp.readline()
#         if not ("did not match any files in the rt/idl-registry" in line or "And idl fetch the latest thrift and proto files." in line or " Please check the" in line):
#             print("{}".format(line.strip().rsplit('/', 1)[0]))
#             outF.write(line.strip().rsplit('/', 1)[0])
#             outF.write("\n")
#             cnt += 1
# outF.close()




filepath = 'output_1.txt'
outF = open("idl_fetch_thrift.txt", "w")

with open(filepath) as fp:
   line = fp.readline()
   cnt = 1
   while line:
        line = fp.readline()
        if (".thrift" in line or ".proto" in line):
            print("{}".format(line.strip().rsplit('/', 1)[0]))
            outF.write(line.strip().rsplit('/', 1)[0])
            outF.write("\n")
            cnt += 1
outF.close()