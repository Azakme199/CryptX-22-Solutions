from Crypto.Util.number import *

def lift(f, p, k, previous):
    result = []
    df = diff(f)
    for lower_solution in previous:
        dfr = Integer(df(lower_solution))
        fr = Integer(f(lower_solution))
        if dfr % p != 0:
            t = (-(xgcd(dfr, p)[1]) * int(fr / p ** (k - 1))) % p
            result.append(lower_solution + t * p ** (k - 1))
        if dfr % p == 0:
            if fr % p ** k == 0:
                for t in range(0, p):
                    result.append(lower_solution + t * p ** (k - 1))
    return result
 
def hensel_lifting(f, p, k, base_solution):
    solution = base_solution
    for i in range(2, k + 1):
        solution = lift(f, p, i, solution)
    return solution

a=33082998332584638566587125764184420867617324148502431151813822348987775700127775823856251326490503047658083961022734
b=38848025438405538237400915804996834418366331251707458369278063801247549776508137044348997971448661015434158869739125
rem=16529556519943321362765374537857289447769907287823881733923991961547660872571319581737521354764925213188468331136984
ct=2061913358303018005877994008502334458814131193142666966850360999256879910858083771920447469745590604098002944308216

p = 3
k = 243
N = p^k

# P.<x> = PolynomialRing(Zmod(p))
# f = (x^2 - a*x + b) - rem
# r = f.monic().roots()
# print(r)

base = [1]

P.<x> = PolynomialRing(Zmod(N))
f = (x^2 - a*x + b) - rem
r = hensel_lifting(f, p, k, base)
print(r)

for solution in r:
    print(long_to_bytes(solution^^ct))

# cryptX{A7_7H3_S7R0K3_0F_M1DN16HT}
# https://amritabi0s.wordpress.com/2019/03/18/confidence-teaser-ctf-crypto-writeups/
# 