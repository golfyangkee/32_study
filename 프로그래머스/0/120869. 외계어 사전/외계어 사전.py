def solution(spell, dic):
    # answer = 2
    # result = []
    # for i in dic:
    #     if len(i) == len(spell):
    #         for j in spell:
    #             i = i.replace(j, '', 1)
    #     result.append(i)
    # if '' in result:
    #     answer = 1
    # return answer

# 셋 (집합) 특성 이용하기
    spell = set(spell)
    for i in dic:
        if not spell-set(i):
            return 1
    return 2