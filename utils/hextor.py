import sys

ARGUMENT_COUNT = 2
SPLIT = 2

def conv(c):
    return int(c, 16)

def main():
    print(sys.argv, len(sys.argv))
    if len(sys.argv) != ARGUMENT_COUNT:
        raise Exception("Incorrect number of arguments provided")
    t_string = sys.argv[1]

    print([conv(t_string[i:i+SPLIT]) for i in range(0,len(t_string),SPLIT)])

if __name__ == "__main__":
    main()
