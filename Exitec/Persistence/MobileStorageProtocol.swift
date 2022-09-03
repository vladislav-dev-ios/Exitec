//
//  MobileStorage.swift
//  Exitec
//
//  Created by Владислав Кузьмичёв on 03.09.2022.
//

import Foundation

protocol MobileStorageProtocol {
    
    func getAll() -> Set<Mobile>
    
    func findByImei(_ imei: String) -> Mobile?
    
    func save(_ mobile: Mobile) throws -> Mobile
    func delete(_ product: Mobile) throws
    func exists(_ product: Mobile) -> Bool
}

public protocol Entity {
    associatedtype StoreType: Storable
    
    func toStorable() -> StoreType
}

public protocol Storable {
    associatedtype EntityObject: Entity
    
    var modelObject: EntityObject { get }
    var uuid: String { get }
}
