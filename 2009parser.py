from bs4 import BeautifulSoup
import sys

fn = sys.argv[1]

with open(fn, "r") as inf:
    html_doc = inf.read()

soup = BeautifulSoup(html_doc, 'html.parser')

for j in soup.find_all("span"):
    print(j.text)
