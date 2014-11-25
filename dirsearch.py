import os
for root, dirs, files in os.walk('.'):
  if len(dirs + files) == 1: print(root)
