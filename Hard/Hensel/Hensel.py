from Crypto.Util.number import getPrime, getRandomNBitInteger

flag = b""
m = int.from_bytes(flag, "big")

p = getPrime(380)
ct = m ^ p
a = getRandomNBitInteger(384)
b = getRandomNBitInteger(384)

n = pow(3, 243)

rem = (pow(p, 2, n) - a * p + b) % n

print(f"a={a}")
print(f"b={b}")
print(f"rem={rem}")
print(f"ct={ct}")

"""
    a=33082998332584638566587125764184420867617324148502431151813822348987775700127775823856251326490503047658083961022734
    b=38848025438405538237400915804996834418366331251707458369278063801247549776508137044348997971448661015434158869739125
    rem=16529556519943321362765374537857289447769907287823881733923991961547660872571319581737521354764925213188468331136984
    ct=2061913358303018005877994008502334458814131193142666966850360999256879910858083771920447469745590604098002944308216
"""
