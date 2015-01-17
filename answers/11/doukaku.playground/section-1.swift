// 最初にtestが全部通るまで49分

import Foundation

class Solver {
    typealias InputType = [Int]
    typealias OutputType = [Int]
    
    func parse_(input:String) -> Int {
        let scanner = NSScanner(string: input)
        var n : UInt32 = 0
        let didScan = scanner.scanHexInt(&n)
        return didScan ? Int(n) : 0
    }
    
    func parse(input:String) -> InputType {
        var ss = input.componentsSeparatedByString("-")
        return ss.map { s in self.parse_(s) }
    }
    
    func format(result:OutputType) -> String {
        return join("", result.map { $0.description })
    }
    
    func solve_(input:InputType) -> OutputType {
        var result = Array(0...8)
        
        for n in input {
            let n_ = n ^ (n<<1)
            var tmp : Int? = nil
            
            for i in 0...8 {
                if n_ & (1<<(8-i)) != 0 {
                    if let tmp_ = tmp {
                        swap(&result[tmp_], &result[i])
                        tmp = nil
                    } else {
                        tmp = i
                    }
                }
            }
        }
        
        return result
    }
    
    func solve(input:String) -> String {
        return format(solve_(parse(input)))
    }
}

var testData : [(String,String)] = []

func test(input:String, expected:String) {
    let t = (input,expected)
    testData.append(t)
}

func t(n:Int) -> Bool {
    let (input,expected) = testData[n]
    let actual = Solver().solve(input)
    return actual == expected
}

func tAll() -> Bool {
    let results = testData.map { (input,expected) in
        Solver().solve(input) == expected
    }
    return reduce(results, true) { (b,b_) in b && b_ }
}

tests()
t(0)
//tAll()

func tests() {
/*0*/ test( "d6-7b-e1-9e", "740631825" );
/*1*/ test( "83-4c-20-10", "123805476" );
/*2*/ test( "fb-f7-7e-df", "274056813" );
/*3*/ test( "55-33-0f-ff", "123456780" );
/*4*/ test( "00-00-00-00", "012345678" );
/*5*/ test( "00-00-00-55", "021436587" );
/*6*/ test( "40-10-04-01", "021436587" );
/*7*/ test( "00-00-aa-00", "103254768" );
/*8*/ test( "80-20-08-02", "103254768" );
/*9*/ test( "ff-7e-3c-18", "876543210" );
/*10*/ test( "aa-55-aa-55", "351708264" );
/*11*/ test( "55-aa-aa-55", "012345678" );
/*12*/ test( "db-24-db-e7", "812543670" );
/*13*/ test( "00-01-00-40", "021345687" );
/*14*/ test( "00-00-80-00", "102345678" );
/*15*/ test( "01-40-00-00", "021345687" );
/*16*/ test( "00-00-00-02", "012345768" );
/*17*/ test( "00-00-02-00", "012345768" );
/*18*/ test( "00-14-00-00", "012436578" );
/*19*/ test( "00-00-01-40", "021345687" );
/*20*/ test( "00-80-01-00", "102345687" );
/*21*/ test( "c8-00-00-81", "120354687" );
/*22*/ test( "05-48-08-14", "021435687" );
/*23*/ test( "24-05-00-f0", "413205687" );
/*24*/ test( "40-08-14-01", "021536487" );
/*25*/ test( "18-c8-80-80", "210534678" );
/*26*/ test( "1c-88-52-00", "120564738" );
/*27*/ test( "ec-dc-67-62", "213468705" );
/*28*/ test( "0a-b6-60-e9", "035162784" );
/*29*/ test( "52-d6-c6-c2", "120345678" );
/*30*/ test( "47-e7-b0-36", "231047658" );
/*31*/ test( "0f-85-91-aa", "108263754" );
/*32*/ test( "76-b6-ed-f3", "601435782" );
/*33*/ test( "f5-5e-f7-3d", "025847163" );
/*34*/ test( "dd-e7-fb-f9", "610247538" );
/*35*/ test( "8f-f4-af-fd", "583246017" );
/*36*/ test( "bf-fb-cb-f7", "105382674" );
/*37*/ test( "e5-fd-ff-ff", "512046378" );
/*38*/ test( "ef-df-ef-fe", "713205648" );
/*39*/ test( "bf-7f-fd-d7", "826437105" );
/*40*/ test( "36-ff-df-de", "814527603" );
/*41*/ test( "6f-dd-ff-ff", "230685147" );
}
