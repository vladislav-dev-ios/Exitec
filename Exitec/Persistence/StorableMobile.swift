//
//  StorableMobile.swift
//  Exitec
//
//  Created by Владислав Кузьмичёв on 03.09.2022.
//

import Foundation
import RealmSwift

extension Mobile: Entity {
    private var storableMobile: StorableMobile {
        let realmMobile = StorableMobile()
        realmMobile.imei = imei
        realmMobile.model = model
        realmMobile.uuid = imei
        return realmMobile
    }
    
    func toStorable() -> StorableMobile {
        return storableMobile
    }
}

class StorableMobile: Object, Storable {
    
    @objc dynamic var imei: String = ""
    @objc dynamic var model: String = ""
    @objc dynamic var uuid: String = ""
    
    var modelObject: Mobile {
        get {
            return Mobile(imei: imei, model: model)
        }
    }
    
    override static func primaryKey() -> String? {
        return "uuid"
    }
}
