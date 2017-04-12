//: Playground - noun: a place where people can play

import UIKit

var areas = ["闵行区莘庄镇","兰州七里河区","三明市龙溪县","西宁城西区","广州白云区","闽侯县上街镇","哈尔滨市南岗区","临汾市尧都区","成都武侯区","汕头市金平区","长沙市芙蓉区"]
var areaImages = ["xinzhuang","qilihe","youxi","chengxi","baiyun","shangjie","nangang","yaodu","wuhou","jinping","furong"]
var provinces = ["上海","甘肃","福建","青海","广东","福建","黑龙江","山西","四川","广东","湖南"]
var parts = ["华南","西北","东南","西北","华南","东南","东北","西北","西南","华南","华中"]
var visited = [Bool](repeatElement(false, count: 11))

for i in 0 ..< areas.count {
    print("Area(name: \"\(areas[i])\", province: \"\(provinces[i])\", part: \"\(parts[i])\", image: \"\(areaImages[i])\", isvisited: \(visited[i]))",",")
}
