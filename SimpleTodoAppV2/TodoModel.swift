//
//  File.swift
//  SimpleTodoAppV2
//
//  Created by Atsushi KONISHI on 2018/08/07.
//  Copyright © 2018年 小西篤志. All rights reserved.
//

import Foundation
import RealmSwift

class TodoModel {
//    private var todos: [Todo] = []
    
//    それぞれの引数にあるcompletionはdbの操作を行った後にControllerが行う処理を(ViewControllerにて)書く
    
    func read(completion: @escaping (Results<Todo>) -> Void) {
        let realm = try! Realm()
        let todos = realm.objects(Todo.self)
        completion(todos)
    }
    
    func create(t: String, d: Date, m: String, completion:  @escaping (Todo) -> Void) {
        let realm = try! Realm()
//        let id = (todos.last?.id ?? 0) + 1
        let id = (realm.objects(Todo.self).last?.id ?? 0) + 1
//        let todo = Todo(id, t, d, m)
        var todo: Todo = Todo()
        try! realm.write {
//            realm.add(todo)
            todo = realm.create(Todo.self, value: ["id":id,"title":t, "date":d,"memo":m], update: false)
        }
//        todos.append(todo)
        completion(todo)
    }
    
    func update(id: Int, t: String, d: Date, m: String, completion: @escaping (Todo?) -> Void){
        let realm = try! Realm()
        guard var todo = realm.objects(Todo.self).first(where: {$0.id == id}) else { completion(nil); return }
        try! realm.write {
            todo = realm.create(Todo.self, value: ["title":t, "date":d, "memo":m], update: true)
        }
//        todo.title = t
//        todo.date = d
//        todo.memo  = m
        completion(todo)
    }
    
    func delete(id: Int, completion: @escaping (Todo) -> Void) {
        let realm = try! Realm()
        guard let todo = realm.objects(Todo.self).first(where: { $0.id == id }) else { return }
        try! realm.write {
            realm.delete(todo)
        }
        completion(todo)
        
//        guard let index = todos.index(where: {$0.id == id}) else { return }
//        completion(todos.remove(at: index))
    }
}
