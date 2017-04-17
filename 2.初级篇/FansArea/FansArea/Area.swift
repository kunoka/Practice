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
/*
Area(name: "闵行区莘庄镇卡尼曼路711弄东区新天地21号405", province: "上海", part: "华东", image: "xinzhuang", isvisited: false) ,
Area(name: "兰州七里河区彭家坪路36号兰州理工大学西校区计算机系", province: "甘肃", part: "西北", image: "qilihe", isvisited: false) ,
Area(name: "三明市龙溪县东旭家园83号楼", province: "福建", part: "东南", image: "youxi", isvisited: false) ,
Area(name: "西宁城西区香格里拉路昆仑阳光城5号楼", province: "青海", part: "西北", image: "chengxi", isvisited: false) ,
Area(name: "广州白云区黄石东路江夏东二街200号（地铁2号线江夏站C出口往右约200米）欧陆公园", province: "广东", part: "华南", image: "baiyun", isvisited: false) ,
Area(name: "闽侯县上街镇工银路更好路祝福坊", province: "福建", part: "东南", image: "shangjie", isvisited: false) ,
Area(name: "哈尔滨市南岗区嵩山路126号中植方舟苑1102", province: "黑龙江", part: "东北", image: "nangang", isvisited: false) ,
Area(name: "临汾市尧都区解放东路与姚仙路交汇处恒安新东城逸景40栋3001", province: "山西", part: "西北", image: "yaodu", isvisited: false) ,
Area(name: "成都武侯区丽都路2号置信花园15号1004", province: "四川", part: "西南", image: "wuhou", isvisited: false) ,
Area(name: "汕头市金平区汕樟路16号（中山路与油柑路转角）凯悦华庭3号805", province: "广东", part: "华南", image: "jinping", isvisited: false) ,
Area(name: "长沙市芙蓉区车站北路225号芙蓉园西区9号楼1311", province: "湖南", part: "华中", image: "furong", isvisited: false)
 */
