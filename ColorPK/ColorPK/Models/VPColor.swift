import Foundation

class VPColor
{
    let id: Int
    let color: [String]
    var isLiked: Bool = false
    var likeNum: Int
    
    static func convertColorValue(colors colorStr: String) -> [String] {
        return colorStr.components(separatedBy: "#")
    }
    
    init(id: Int, color: String, isLiked: Bool, likeNum: Int)
    {
        self.id = id
        self.color = VPColor.convertColorValue(colors: color)
        self.isLiked = isLiked
        self.likeNum = likeNum
    }
}


extension VPColor
{
    static func getDummyColorList() -> [VPColor]
    {
        return [
            VPColor(id: 1, color: "062743#113a5d#ff7a8a#f9f9f9", isLiked: true, likeNum: 10),
            VPColor(id: 2, color: "feffdf#dde0ab#97cba9#668ba4", isLiked: false, likeNum: 11),
            VPColor(id: 3, color: "bad7df#ffe2e2#f6f6f6#99ddcc", isLiked: true, likeNum: 12),
            VPColor(id: 4, color: "92e6e6#fff9af#d65d7a#524c84", isLiked: false, likeNum: 13),
        ]
    }
}
