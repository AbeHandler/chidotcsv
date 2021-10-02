'''
py title_processor.py 16.html DLtitleLink
'''
import sys
from bs4 import BeautifulSoup

input_file = sys.argv[1]  # e.g. 16.html
selector = sys.argv[2]  # e.g. "DLtitleLink"

with open(input_file, "r") as inf:
    dt = inf.read()

soup = BeautifulSoup(dt, 'html.parser')
for i in soup.find_all('a', {"class": selector}):
    print(i.text)
