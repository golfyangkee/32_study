def solution(rsp):
    answer = ''
    res = {'2':'0', '0':'5', '5':'2'}
    for i in rsp:
        answer+=res[i]
    return answer