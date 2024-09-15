from math import gcd

fn relative_prime(n: Int) -> List[Int]:
  """
  Returns list of integers up to and relative prime to n.
  """
  var ret = List[Int]()
  for i in range(1, n+1):
    if gcd(i, n) == 1:
      ret.append(i)
  return ret

fn u_orders(n: Int) -> List[Int]:
  """
  Returns the orders of all elements in the multiplicative
  group of integers modulo n (as an indexed array).

  Note, with prime n for even small n (e.g. n=23), the 
  algorithm already starts to fall down. This is because
  e.g. 20^x grows very fast if the order is high, then it
  integer wraps and we're left with 0, which doesn't help
  (actually, maybe some elements have infinite order...)
  """
  var ret = List[Int]()
  var elements = relative_prime(n)
  for e in elements:
    var prod = e[]
    var ord = 1
    while prod % n != 1:
      if prod == 0:
        print("Uh oh")  
        break
      prod = prod * e[]
      ord += 1
    ret.append(ord)

  return ret

fn print_u(n: Int):
  var els = relative_prime(n)
  print("U(" + str(n) + "), order:", len(els))
  var i = 0
  for o in u_orders(n):
    print(els[i], o[])
    i += 1

def main():
  print_u(13)
