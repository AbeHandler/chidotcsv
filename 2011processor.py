import sys
from bs4 import BeautifulSoup

fn = sys.argv[1]

with open(fn, "r") as inf:
    dt = inf.read()

soup = BeautifulSoup(dt, 'html.parser')

papers = set()
for j in soup.find_all("a"):
    if "paper" in j.attrs["href"]:
        print(j.text)
