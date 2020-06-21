//
//  CharacterR.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/21/20.
//

import Foundation
import Realm
import RealmSwift


class CharacterR: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var descriptionText = ""
    @objc dynamic var thumbnail: ImageR?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
