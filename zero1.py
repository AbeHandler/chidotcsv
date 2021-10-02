import sys

pattern = sys.argv[1]

fn = sys.argv[2]


with open(fn, "r") as inf:
    for i in inf:
        if pattern.lower() in i.lower():
            if pattern == "text":
                if "texture" in i.lower():
                    print(0)
                else:
                    print(1)
            else:
                print(1)
        else:
            print(0)
