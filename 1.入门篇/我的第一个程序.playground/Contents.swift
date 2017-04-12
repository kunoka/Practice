//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, 我是葡萄"

let bookButton = UILabel(frame: CGRect(x:0, y:0, width:200, height: 50))

bookButton.text = "加入购物车！"

bookButton.textColor = UIColor.yellow

bookButton.backgroundColor = UIColor.brown
bookButton.textAlignment = .center

bookButton.layer.cornerRadius = 20
bookButton.clipsToBounds = true

bookButton