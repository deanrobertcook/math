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
  """
  var ret = List[Int]()
  var elements = relative_prime(n)
  for e in elements:
    var prod = e[]
    var ord = 1
    while prod != 1:
      prod = prod * e[] % n
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
  print_u(23)
