def solution(angle):
    answer = 1
    if angle == 180:
        answer = 4
    elif angle > 90:
        answer = 3
    elif angle == 90:
        answer=2
    return answer