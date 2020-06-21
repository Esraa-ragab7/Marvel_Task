//
//  RealmSingletoneManager.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/21/20.
//

import Foundation
import Realm
import RealmSwift

class RealmSingletoneManager: NSObject {
    
    // MARK: - ConvertFromCharactersToCharactersR
    
    static func convertFromCharactersToCharactersR(characters: [Character]) -> List<CharacterR> {
        let charactersR = List<CharacterR>()
        
        for character in characters {
            let imageR = ImageR()
            imageR.path = "\((character.thumbnail?.path)!).\((character.thumbnail?.imageExtension)!)"
            let characterR = CharacterR()
            characterR.id = character.id
            characterR.name = character.name ?? ""
            characterR.descriptionText = character.description ?? ""
            characterR.thumbnail = imageR
            charactersR.append(characterR)
        }
        
        return charactersR
    }
    
    // MARK: - AddCharacters
    
    class func addCharactersR(charactersR: List<CharacterR>,completionHandler:@escaping (_ status: Bool,_ msg:String, _ items: List<CharacterR>) -> ()) {
        for characterR in charactersR {
            addCharacterR(characterR: characterR) { _,_ in }
        }
    }
    
    // MARK: - AddCharacter
    
    class func addCharacterR(characterR:CharacterR,completionHandler:@escaping (_ status: Bool,_ msg:String) -> ())
    {
        var realm_: Realm!
        realm_ = try! Realm()
        do {
            try realm_.write({
                var localCharacterR = realm_.object(ofType: CharacterR.self, forPrimaryKey: characterR.id)
                if localCharacterR == nil {
                    realm_.add(characterR)
                } else {
                    localCharacterR = characterR
                }
                completionHandler(true,"")
            })
        }catch let error {
            completionHandler(false ,error.localizedDescription)
        }
    }
    
    // MARK: - GetCharacter
    
    class func getCharacter() -> [Character] {
        var realm_: Realm!
        realm_ = try! Realm()
        
        let arr = realm_.objects(CharacterR.self).toArray(ofType: CharacterR.self) as [CharacterR]
        var characters: [Character] = []
        for elm in arr {
            characters.append(Character.init(id: elm.id, name: elm.name, description: elm.descriptionText, thumbnail: Image(imageUrl: URL(string: (elm.thumbnail?.path)!)!), resourceURI: "", comics: nil, series: nil, stories: nil, events: nil))
        }
        
        return characters
    }
}


extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        
        return array
    }
}
