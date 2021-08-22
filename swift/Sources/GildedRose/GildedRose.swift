protocol ItemClassifying {
    func itemType() -> ItemType
}


public class GildedRose {
    
    var items: [Item]
    
    public required init(items:[Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        items.forEach { $0.age() }
    }
}
