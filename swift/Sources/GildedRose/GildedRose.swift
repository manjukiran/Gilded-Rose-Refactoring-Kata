public class GildedRose {
    
    var items: [Item]
    
    public required init(items:[Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        /** Steps used to migrate **
         1) Create the logic for classifying items
         2) Move the logic to drive the aging factor for each classified item
         3) Apply aging to all items in the array
         */
        items.forEach { $0.applyAgeToQuality() }
    }
}
