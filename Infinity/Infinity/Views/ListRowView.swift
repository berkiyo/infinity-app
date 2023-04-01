import SwiftUI

struct ListRowView: View {
    @Environment(\.scenePhase) var scenePhase
    let item: ItemModel
    var body: some View {
        HStack {
            
            /**
                            The Design
             * User picks emoji for their goal
             * [icon/colour] [name of goal] ------- [date information vstack]
             */

            Text(item.title)
            Spacer()
            VStack(alignment: .trailing){
                let dateStored = String(item.theDate)

                Text(dateStored + " Days")
                Text("Since: " + item.theStartDate.formatted())
                    .font(.caption)
                
            }
        }
        .padding(.vertical, 8)
    }
}
