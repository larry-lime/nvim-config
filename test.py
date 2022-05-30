def test_func(arg: list):
    lst = ['a']
    for i in arg:
        lst.append(i)
        print(i)
    return lst
        
if __name__ == "__main__":
    var = test_func([1,2,3,4])
