# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.


def change_char(char_to_add,index):
    # Use a breakpoint in the code line below to debug your script.
    str_arr=list('abracadabra')
    if index>=1 and index <len(str_arr):
        str_arr[index]=char_to_add
        return ''.join(str_arr) # Press Ctrl+F8 to toggle the breakpoint.
    else:
        return 'invalid index'

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print(change_char('K',5))

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
