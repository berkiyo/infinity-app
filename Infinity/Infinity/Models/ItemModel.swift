import Foundation

/**
 The ItemModel package -- part of the MVVM integration
 */

// Immutable Struct - keep them let.
struct ItemModel: Identifiable, Codable {
    let id: String              // id
    let title: String           // name of streak
    var theDate: Int            // the number of days since streak started
    var isCompleted: Bool       // streak completed status
    var todaysDate: Date        // for storing todays date, this is updated every 24 hours
    
    
    // init
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool, theDate: Int, todaysDate: Date) {
        self.id = id
        self.title = title
        self.theDate = theDate
        self.isCompleted = isCompleted
        self.todaysDate = todaysDate
    }
    
    // update the items
    func updateCompletion() -> ItemModel {
        
        
        var newDate: Int = theDate
        
        
        
        // this is to check the "isCompleted" variable to see if it is time to progress
        if isCompleted == false {
            newDate = newDate + 1
            return ItemModel(id: id, title: title, isCompleted: true, theDate: newDate, todaysDate: todaysDate)
        }
        else {
            newDate = newDate - 1
            return ItemModel(id: id, title: title, isCompleted: false, theDate: newDate, todaysDate: todaysDate)
        }
        
    }
}
