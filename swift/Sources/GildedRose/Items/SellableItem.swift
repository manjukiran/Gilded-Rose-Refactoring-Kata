//
//  Sellable.swift
//  Sellable
//
//  Created by Manju Kiran on 22/08/2021.
//

import Foundation

public protocol AgingItem: Item {
    func applyAgeToQuality()
}

/// Creating a child of the un-modifiable `Item` class to be able to apply efficient business logic for aging
public class SellableItem: Item, AgingItem {

    /// Returns Item Type based on the `name` variable;
    /// This optimises the computation for the array as we dont need to run the switch statement hundreds of times
    lazy var itemType: ItemType = {
        return ItemType.create(from: name)
    }()
    
    public func applyAgeToQuality() {
        guard itemType != .sulfuras else { return }
        let expiryDateFactor = self.sellIn <= 0 ? 2 : 1
        var newQuality = self.quality - (agingFactor * expiryDateFactor)
        if newQuality > 50 {
            newQuality = 50
        } else if newQuality < 0 {
            newQuality = 0
        }
        quality = newQuality
        sellIn -= 1
    }
    
}

private extension SellableItem {
    
    /// Provides an age factor based on the type and rules specified in the reqirement
    var agingFactor: Int {
        switch itemType {
        case .normalItem: // Degrades normally
            return 1
        case .conjuredItem: // Degrades twice as fast as normal items
            return 2
        case .agedBrie: // Increases in quality normally
            return -1
        case .sulfuras: // Sulfuras doesnt age // Code unnecessary but placed for posterity and future changes
            return 0
        case .backstagePasses:
            switch sellIn {
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
}
