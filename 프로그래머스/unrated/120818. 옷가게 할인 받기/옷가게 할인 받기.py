def solution(price):
    if price>=500000:
        price= int(price*0.8)
    elif price>=300000:
        price=int(price*0.9)
    elif price>=100000:
        price=int(price*0.95)
    else:
        return price
    answer = price
    return answer