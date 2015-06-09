try:
    from demolib import demolib
    demolib_available = True
except ImportError:
    demolib_available = False


def get_local_factor():
    return 10


def compute(x):
    factor = get_local_factor()
    return factor * demolib.compute_demo(x)


def main():
    import sys
    print compute(int(sys.argv[1]))
