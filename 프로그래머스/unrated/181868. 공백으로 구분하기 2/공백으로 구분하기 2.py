def solution(my_string):
    answer = []
    answer=my_string.split(' ')
    for i in range(answer.count("")):
        answer.remove("")
    return answer
