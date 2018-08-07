//
//  Todo.swift
//  SimpleTodoAppV2
//
//  Created by Atsushi KONISHI on 2018/08/07.
//  Copyright © 2018年 小西篤志. All rights reserved.
//

import Foundation

class Todo {
    var id: Int
    var title: String
    var date: Date
    var memo: String
    
    init(_ i: Int, _ t: String, _ d: Date, _ m: String) {
        id = i
        title = t
        date = d
        memo = m
        print(id)
    }
}
