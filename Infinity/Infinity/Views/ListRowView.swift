import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    var body: some View {
        HStack {
            if (item.isCompleted){
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
                
            } else {
                Image(systemName: "circle")
                    .foregroundColor(.red)
            }
            Text(item.title)
            Spacer()
            let dateStored = String(item.theDate)
            Text(dateStored + " Days")
        }
        .padding(.vertical, 8)
    }
}
