//
//  Area.swift
//  FansArea
//
//  Created by harry on 12/04/2017.
//  Copyright © 2017 harry. All rights reserved.
//

struct Area {  // 名字与文件名相同
    var name : String
    var province : String
    var part : String
    var image : String
    var isvisited : Bool
    var rating = ""
    
    init(name: String, province: String, part: String, image: String, isvisited: Bool) {
        self.name = name
        self.province = province
        self.part = part
        self.image = image
        self.isvisited = isvisited
    }
}

