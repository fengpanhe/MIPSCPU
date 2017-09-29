import re
com_str_list = []
bin_num_list = []
hex_num_list = []
with open('test.txt') as f1:
    for com_str in f1.readlines():
        com_str_list.append(com_str.rstrip('\n'))
with open('test.coe') as f2:
    for bin_str in f2.readlines()[2:]:
        bin_num = re.split(r'[;,\s]\s*', bin_str)[0]
        hex_num = hex(int(bin_num, 2))
        bin_num_list.append(bin_num)
        hex_num_list.append(hex_num)

for i in range(len(com_str_list)):
    print('%-15s %-32s %s' % (com_str_list[i], bin_num_list[i], hex_num_list[i]))
