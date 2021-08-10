#!/usr/bin/env python3

import os 
print('setenv...', end=' ')	
print(os.environ['USERNAME'])		# 输出当前shell的变量值
print(os.environ['PASSWORD'])	

os.environ['USERNAME'] = 'renweikg@gmail.com'	# 在后台运行 os.putenv
os.system('python main.py')
os.environ['PASSWORD'] = 'renwei1988'	# 在后台运行 os.putenv
os.system('python main.py')
