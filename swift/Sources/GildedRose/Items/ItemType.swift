//
//  ItemType.swift
//  ItemType
//
//  Created by Manju Kiran on 22/08/2021.
//

import Foundation

enum ItemType: String {
    case normalItem
    case conjuredItem
    case agedBrie = "Aged Brie"
    case sulfuras = "Sulfuras, Hand of Ragnaros"
    case backstagePasses = "Backstage passes to a TAFKAL80ETC concert"
    
    static func create(from name: String) -> ItemType {
        // Wish we can talk to goblin to make the name as a `let` constant for item
        if let type = ItemType(rawValue: name) {
            return type
        } else {
            if name.lowercased().contains("conjured") {
                return .conjuredItem
            } else {
                return .normalItem
            }
        }
    }
}
