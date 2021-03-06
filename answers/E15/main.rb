require 'pry'

# main
# ------------------------------------------------------------------------------

def n0(n)
  ret = []
  # ?
  # ?
  ret << n+1
  ret << n+2
  ret
end

def n1(n)
  x = n - 1
  i = 3
  i *= 3 while i < x

  while 0 < i do
    d,m = x.divmod(i)
    if m == 0 && d == 1
      return [n-1, n - 1 + i]
    end
    x = m
    i /= 3
  end

  [n-1]
end

def n2(n)
  x = n + 1
  i = 3
  i *= 3 while i < x

  while 0 < i do
    d,m = x.divmod(i)
    if m == 0 && d == 1
      return [n-2, n + 1 + i]
    end
    x = m
    i /= 3
  end

  [n-2]
end

def hoge(n)
  case n % 3
  when 0
    n0(n)
  when 1
    n1(n)
  when 2
    n2(n)
  end
end

def solve(input)
  pos = find_pos input
  check (move pos)
end

def parse(input)
  input
end

binding.pry
1

# test
# ------------------------------------------------------------------------------

$index = 0
def test(input, expected)
  actual = (solve(parse input)).to_s
  ret = actual.to_s == expected
  unless ret
    p [$index, actual, expected, ret, input]
  end
  $index += 1
end

# test( "21", "19,22,23" );
# test( "0", "1,2" );
# test( "1", "0,3" );
# test( "2", "0,6" );
# test( "3", "1,4,5" );
# test( "4", "3,9" );
# test( "9", "4,10,11" );
# test( "15", "11,16,17" );
# test( "27", "13,28,29" );
# test( "32", "30" );
# test( "47", "45,51" );
# test( "65", "63,69" );
# test( "80", "78,162" );
# test( "199", "198,201" );
# test( "204", "200,205,206" );
# test( "243", "121,244,245" );
# test( "493", "492" );
# test( "508", "507" );
# test( "728", "726,1458" );
# test( "793", "792,795" );
# test( "902", "900,906" );
# test( "981", "976,982,983" );
# test( "1093", "1092,2187" );
# test( "1202", "1200" );
# test( "1300", "1299,1305" );
# test( "1962", "1952,1963,1964" );
# test( "2188", "2187,2190" );
# test( "2405", "2403,2409" );
# test( "3326", "3324" );
# test( "6561", "3280,6562,6563" );
# test( "6612", "6608,6613,6614" );
# test( "7058", "7056,7062" );
# test( "8444", "8442,8448" );
# test( "9841", "9840,19683" );
# test( "15243", "15239,15244,15245" );
# test( "19946", "19944,19950" );
# test( "21148", "21147" );
# test( "39365", "39363" );
# test( "39366", "19682,39367,39368" );
# test( "55694", "55692,55698" );
# test( "57245", "57243" );
# test( "66430", "66429,66432" );
# test( "92740", "92739" );
# test( "115250", "115248" );
# test( "163031", "163029" );
# test( "221143", "221142,221157" );
# test( "410353", "410352" );
# test( "412649", "412647,412659" );
# test( "550391", "550389" );
# test( "699921", "699880,699922,699923" );
# test( "797161", "797160,1594323" );
# test( "1000000", "999999,1000002" );
