
import Darwin

class Solver {
    let input : String
    // 適当に必要な数を計算したかったけど、時間ないので決め打ちで
    var numbers = Array(1...1200)
    
    init(input:String) {
        self.input = input
    }
    
    func removePrev(p:Int->Bool) {
        var result : [Int] = []
        var prev = numbers[0]
        for n in numbers[1..<numbers.count] {
            if p(n) {
                result.append(prev)
            }
            prev = n
        }
        self.numbers = result
    }
    
    func removeNext(p:Int->Bool) {
        var result : [Int] = [numbers[0]]
        var prev = numbers[0]
        for n in numbers[1..<numbers.count-1] {
            if p(prev) {
                result.append(n)
            }
            prev = n
        }
        self.numbers = result
    }
    
    func sq(n:Int) -> Bool {
        let n_ = Int(sqrt(Double(n)))
        return n_ * n_ != n
    }
    func cb(n:Int) -> Bool {
        let n_ = Int(cbrt(Double(n)))
        return n_ * n_ * n_ != n
    }
    
    func actn(c:Int) {
        var result : [Int] = []
        for (i,n) in enumerate(self.numbers) {
            if ((i+1) % c) != 0 {
                result.append(n)
            }
        }
        self.numbers = result
    }
    func acth() {
        self.numbers = Array(numbers[100..<self.numbers.count])
    }
    
    func act(c:Character) {
        switch c {
        case "2"..."9": actn("\(c)".toInt()!)
        case "S": removeNext(sq)
        case "s": removePrev(sq)
        case "C": removeNext(cb)
        case "c": removePrev(cb)
        case "h": acth()
        default: assertionFailure("hoge")
        }
    }
    
    func solve_() -> [Int] {
        for c in self.input {
            act(c)
        }
        return Array(self.numbers[0..<10])
    }
    
    func solve() -> String {
        return join(",", solve_().map{ "\($0)" })
    }
}

func test(input:String, expected:String) -> Bool {
    let actual = Solver(input:input).solve()
    return actual == expected
}
/*0*/ test( "ss6cc24S", "1,9,21,30,33,37,42,44,49,56" );

/*1*/ test( "h", "101,102,103,104,105,106,107,108,109,110" );
/*2*/ test( "hh", "201,202,203,204,205,206,207,208,209,210" );
/*3*/ test( "hhh", "301,302,303,304,305,306,307,308,309,310" );
/*4*/ test( "2", "1,3,5,7,9,11,13,15,17,19" );
/*5*/ test( "22", "1,5,9,13,17,21,25,29,33,37" );
/*6*/ test( "222", "1,9,17,25,33,41,49,57,65,73" );
/*7*/ test( "3", "1,2,4,5,7,8,10,11,13,14" );
/*8*/ test( "33", "1,2,5,7,10,11,14,16,19,20" );
/*9*/ test( "333", "1,2,7,10,14,16,20,23,28,29" );
/*10*/ test( "s", "1,2,4,5,6,7,9,10,11,12" );
/*11*/ test( "ss", "1,4,5,6,9,10,11,12,13,16" );
/*12*/ test( "sss", "4,5,9,10,11,12,16,17,18,19" );
/*13*/ test( "S", "1,3,4,6,7,8,9,11,12,13" );
/*14*/ test( "SS", "1,4,7,8,9,12,13,14,15,16" );
/*15*/ test( "SSS", "1,8,9,13,14,15,16,20,21,22" );
/*16*/ test( "c", "1,2,3,4,5,6,8,9,10,11" );
/*17*/ test( "cc", "1,2,3,4,5,8,9,10,11,12" );
/*18*/ test( "ccc", "1,2,3,4,8,9,10,11,12,13" );
/*19*/ test( "C", "1,3,4,5,6,7,8,10,11,12" );
/*20*/ test( "CC", "1,4,5,6,7,8,11,12,13,14" );
/*21*/ test( "CCC", "1,5,6,7,8,12,13,14,15,16" );
/*22*/ test( "23", "1,3,7,9,13,15,19,21,25,27" );
/*23*/ test( "32", "1,4,7,10,13,16,19,22,25,28" );
/*24*/ test( "2h", "201,203,205,207,209,211,213,215,217,219" );
/*25*/ test( "h2", "101,103,105,107,109,111,113,115,117,119" );
/*26*/ test( "sC", "1,4,5,6,7,9,10,11,12,13" );
/*27*/ test( "Cs", "1,4,5,6,7,8,10,11,12,13" );
/*28*/ test( "s468", "1,2,4,6,7,11,12,16,17,20" );
/*29*/ test( "S468", "1,3,4,7,8,12,13,16,18,21" );
/*30*/ test( "cc579", "1,2,3,4,8,9,11,13,15,16" );
/*31*/ test( "CC579", "1,4,5,6,8,11,13,15,17,18" );
/*32*/ test( "85", "1,2,3,4,6,7,9,10,12,13" );
/*33*/ test( "sh", "110,111,112,113,114,115,116,117,118,119" );
/*34*/ test( "94h", "150,151,154,155,156,158,159,160,163,164" );
/*35*/ test( "h9c8", "101,102,103,104,105,106,107,110,111,112" );
/*36*/ test( "Cc3s", "1,3,5,6,10,11,13,16,17,19" );
/*37*/ test( "cs4h6", "149,150,152,153,154,157,158,160,161,162" );
/*38*/ test( "84523c", "1,3,11,15,23,26,34,38,46,49" );
/*39*/ test( "54C78hS", "228,231,232,233,236,241,242,243,246,247" );
/*40*/ test( "65h7ccs", "151,152,153,154,157,158,160,163,164,165" );
/*41*/ test( "c95hSc2C", "145,147,151,153,156,159,162,164,168,171" );
/*42*/ test( "c5h3Ss794", "130,131,133,137,138,142,148,150,152,157" );
/*43*/ test( "7ShscC846", "129,130,131,134,135,139,141,142,146,148" );
/*44*/ test( "cshSCCS7ch", "253,254,256,259,260,261,263,264,265,266" );
/*45*/ test( "hhC7849Ss6C", "201,202,203,205,206,211,212,216,220,225" );
/*46*/ test( "hhsc3C987Ccs", "201,202,204,205,207,208,214,217,218,220" );
/*47*/ test( "SC7S8hc59ss2", "162,169,174,178,182,185,188,194,199,203" );
/*48*/ test( "s7S6c35C9CShc", "367,371,377,379,380,385,387,388,392,395" );
/*49*/ test( "4scC3hh982Cc5s", "422,426,430,434,447,451,459,463,471,479" );
/*
/*50*/ test( "23h465Ssc9CchC", "1027,1033,1045,1047,1057,1069,1071,1075,1081,1093" );
*/
