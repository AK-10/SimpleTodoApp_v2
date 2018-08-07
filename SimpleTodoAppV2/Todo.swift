//
//  Todo.swift
//  SimpleTodoAppV2
//
//  Created by Atsushi KONISHI on 2018/08/07.
//  Copyright © 2018年 小西篤志. All rights reserved.
//

import Foundation
import RealmSwift

final class Todo: Object {
    @objc dynamic var id: Int = -1
    @objc dynamic var title: String = ""
    @objc dynamic var date: Date = Date()
    @objc dynamic var memo: String = ""
    
//    convenience init(_ i: Int, _ t: String, _ d: Date, _ m: String) {
//        self.init()
//        id = i
//        title = t
//        date = d
//        memo = m
//    }
    
    //primaryKeyを定義
    override static func primaryKey() -> String? {
        return "id"
    }
}
