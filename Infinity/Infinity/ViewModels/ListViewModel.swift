import SwiftUI
import Foundation

/**
 CRUD FUNCTIONS
 - Create
 - Read
 - Update
 - Delete
 */
class ListViewModel: ObservableObject {
    // @State can only be used in a View, not a class.
    
    @Published var items: [ItemModel] = [] {
        didSet { // master
            saveItems()
        }
    }
    let itemsKey: String = "items_list"
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        // then
        self.items = savedItems // update!
    }
    
    // function to delete items from list
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    // function to delete items from list
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    // function to add items to list
    func addItem(title: String, theDate: Int, theStartDate: Date, theColor: Int) {
        let newItem = ItemModel(title: title, isCompleted: false, theDate: theDate, theStartDate: theStartDate, theColor: theColor)
        items.append(newItem)
    }
    
    // updateItem
    func updateItem(item: ItemModel) {
        // SHORTER + BETTER
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    // save items
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
