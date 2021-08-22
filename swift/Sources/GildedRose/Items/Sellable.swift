//
//  Sellable.swift
//  Sellable
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
}

protocol AgingItem: Item {
    func itemType() -> ItemType
    func agingFactor() -> Int
    func age()
}

extension Item: AgingItem {

    func itemType() -> ItemType {
        // Wish we can talk to goblin to make the name as a `let` constant for item
        if let type = ItemType(rawValue: self.name) {
            return type
        } else {
            if self.name.lowercased().contains("conjured") {
                return .conjuredItem
            } else {
                return .normalItem
            }
        }
    }
    
    func agingFactor() -> Int {
        switch self.itemType () {
        case .normalItem:
            return 1
        case .conjuredItem: // Degrades in Quality twice as fast as normal items
            return 2
        case .agedBrie: // Increases in quality
            return -1
        case .sulfuras: // Sulfuras doesnt age // Code unnecessary but for posterity
            return 0
        case .backstagePasses:
            switch self.sellIn {
            case 11... : // Degrade as normal until 10 days to concert
                return -1
            case 6...10 : // Quality increases by 2 when there are 10 days or less
                return -2
            case 1...5 : // Quality increases by 3 when there are 5 days or less
                return -3
            default: // Drops to 0 after the concert
                return quality
            }
        }
    }
    
    func age() {
        guard itemType() != .sulfuras else { return }
        let expiryDateFactor = self.sellIn <= 0 ? 2 : 1
        var newQuality = self.quality - (agingFactor() * expiryDateFactor)
        if newQuality > 50 {
            newQuality = 50
        } else if newQuality < 0 {
            newQuality = 0
        }
        quality = newQuality
        sellIn -= 1
    }
    
}

