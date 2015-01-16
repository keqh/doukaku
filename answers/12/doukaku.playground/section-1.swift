
import Foundation

class Solver {
    func solve(input:String) -> String {
        var pos = (1,2,3)
        var result = "1"
        for c in input {
            let (z,y,x) = pos
            switch c {
            case "N": pos = (7-y,z,x)
            case "S": pos = (y,7-z,x)
            case "E": pos = (x,y,7-z)
            case "W": pos = (7-x,y,z)
            default: 0
            }
            result += "\(pos.0)"
        }
        return result
    }
}

func test(input:String, expected:String) -> Bool {
    let actual = Solver().solve(input)
    return actual == expected
}

/*0*/ test( "NNESWWS", "15635624" );
/*1*/ test( "EEEE", "13641" );
/*2*/ test( "WWWW", "14631" );
/*3*/ test( "SSSS", "12651" );
/*4*/ test( "NNNN", "15621" );
/*5*/ test( "EENN", "13651" );
/*6*/ test( "WWNN", "14651" );
/*7*/ test( "SSNN", "12621" );
/*8*/ test( "NENNN", "153641" );
/*9*/ test( "NWNNN", "154631" );
/*10*/ test( "SWWWSNEEEN", "12453635421" );
/*11*/ test( "SENWSWSNSWE", "123123656545" );
/*12*/ test( "SSSWNNNE", "126546315" );
/*13*/ test( "SWNWSSSWWE", "12415423646" );
/*14*/ test( "ENNWWS", "1354135" );
/*15*/ test( "ESWNNW", "1321365" );
/*16*/ test( "NWSSE", "154135" );
/*17*/ test( "SWNWEWSEEN", "12415154135" );
/*18*/ test( "EWNWEEEEWN", "13154532426" );
/*19*/ test( "WNEWEWWWSNW", "145151562421" );
/*20*/ test( "NNEE", "15631" );
/*21*/ test( "EEEEWNWSW", "1364145642" );
/*22*/ test( "SENNWWES", "123142321" );
/*23*/ test( "SWWWSNSNESWW", "1245363635631" );
/*24*/ test( "WESSENSE", "141263231" );
/*25*/ test( "SWNSSESESSS", "124146231562" );
/*26*/ test( "ENS", "1353" );
/*27*/ test( "WNN", "1453" );
/*28*/ test( "SSEENEEEN", "1263124536" );
/*29*/ test( "NWSNNNW", "15414632" );
/*30*/ test( "ESSSSSWW", "132453215" );
/*31*/ test( "ESE", "1326" );
/*32*/ test( "SNWNWWNSSSS", "121456232453" );
/*33*/ test( "SWEESEN", "12423653" );
/*34*/ test( "NEEWNSSWWW", "15323631562" );
/*35*/ test( "WSEW", "14212" );
/*36*/ test( "SWSNNNSNWE", "12464131353" );
/*37*/ test( "ENWEWSEEW", "1351513545" );
/*38*/ test( "WSEWN", "142124" );
/*39*/ test( "EWNEESEWE", "1315321414" );
/*40*/ test( "NESEEN", "1531263" );
/*41*/ test( "WSW", "1426" );
/*42*/ test( "ENEWE", "135656" );
