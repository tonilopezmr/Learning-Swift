//
//  SQLiteDataSource.swift
//  My First IOS App
//
//  Created by Antonio López Marín on 02/02/16.
//  Copyright © 2016 Antonio López Marín. All rights reserved.
//

import RealmSwift

class SQLiteDataSource: DataSourceProtocol {
    
    init(){
    }
    
    func add(item: Subject) -> Subject{
        let realm = try! Realm()
        
        let subject = SubjectEntity()
        subject.id = getNewId(realm)
        subject.name = item.name
        
        try! realm.write {
            realm.add(subject)
        }
        return transform(subject)
    }
    
    private func getNewId(realm: Realm) -> Int{
        let query = realm.objects(SubjectEntity)
        if query.count > 0 {
            return query.max("id")! + 1
        }
        return 0
    }
    
    func remove(item: Subject){
        let realm = try! Realm()
        
        let entity = realm.objects(SubjectEntity).filter("id == %@", item.id).first!
        
        try! realm.write {
            realm.delete(entity)
        }
    }
    
    func update(item: Subject){
    }

    func get(item: Subject) -> Subject{
        let realm = try! Realm()
        let query = realm.objects(SubjectEntity).filter(NSPredicate(format: "id == %@", item.id))
        let subject = query.first ?? SubjectEntity(value: ["id" : 1 , "name" : "Error subject"])
        return transform(subject!)
    }
    
    func getElements(result: Results<SubjectEntity>) -> [Subject]{
        var items: [Subject] = []
        for var i = 0; i < result.count; i++ {
            items.append(transform(result[i]))
        }
        
        return items
    }
    
    func getAll() -> [Subject]{
        let realm = try! Realm()
        let query = realm.objects(SubjectEntity)
        return getElements(query)
    }
    
    func transform(item: Subject) -> SubjectEntity {
        let entity = SubjectEntity()
        entity.id = item.id
        entity.name = item.name
        return entity
    }
    
    func transform(entity: SubjectEntity) -> Subject {
        return Subject(id: entity.id, name: entity.name)
    }
    
    func transform(entities: [SubjectEntity]) -> [Subject]{
        var items: [Subject] = []
        for entity in entities {
            items.append(transform(entity))
        }
        return items
    }
}