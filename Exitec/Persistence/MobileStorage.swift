//
//  MobileStorage.swift
//  Exitec
//
//  Created by Владислав Кузьмичёв on 03.09.2022.
//

import Foundation
import RealmSwift

class MobileStorage: MobileStorageProtocol {
    
    private let realm: Realm
    
    init() {
        realm = try! Realm()
    }
    
    func getAll() -> Set<Mobile> {
        let objects = realm.objects(Mobile.StoreType.self)
        
        return Set(objects.compactMap{ $0.modelObject })
    }
    
    func findByImei(_ imei: String) -> Mobile? {
        let predicate = NSPredicate(format: "uuid == %@", imei)
        if let mobile = realm.objects(Mobile.StoreType.self)
            .filter(predicate).first {
            return mobile.modelObject
        } else {
            return nil
        }
    }
    
    func save(_ mobile: Mobile) throws -> Mobile {
        try realm.write {
            realm.add(mobile.toStorable())
        }
        
        return mobile
    }
    
    func delete(_ product: Mobile) throws {
        try realm.write {
            let predicate = NSPredicate(format: "uuid == %@", product.toStorable().uuid)
            if let productToDelete = realm.objects(Mobile.StoreType.self)
                .filter(predicate).first {
                realm.delete(productToDelete)
            }
        }
    }
    
    func exists(_ product: Mobile) -> Bool {
        let objects = getAll()
        
        for object in objects {
            if product.imei == object.imei {
                return true
            }
        }
        
        return false
    }
}
