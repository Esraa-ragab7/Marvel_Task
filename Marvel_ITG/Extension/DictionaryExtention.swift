//
//  DictionaryExtention.swift
//  Marvel_ITG
//
//  Created by Esraa Mohamed Ragab on 6/20/20.
//

import Foundation

extension Dictionary {
    var queryString: String? {
        return self.reduce("") { "\($0!)\($1.0)=\($1.1)&" }
    }
}
