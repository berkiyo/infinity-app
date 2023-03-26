import SwiftUI

// ListView
struct ListView: View {
    
    // See --> "ListViewModel.swift"
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var showingAlert = false // this is for our alertview.
    @State var isEditing = false
    @State var isModal: Bool = false
    
    /**
     Start Body
     */
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty { // if there are no items, run this code.
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) {
                        item in ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item) // update item
                                    
                                    // formatting the date
                                    let formatter = DateFormatter()
                                    formatter.dateFormat = "d"
                                    let newDate = formatter.string(from: item.todaysDate)
                                    let newDateInt = Int(newDate) ?? 0
                                    print(newDateInt) // DEBUG PURPOSES
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem) // all from "ListViewModel.swift"
                    .onMove(perform: listViewModel.moveItem)
                }
                .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive)).animation(.easeIn)
            }
        }
        .navigationTitle("Infinity")
        .navigationBarItems(
            leading:
                Button(action: {
                    self.isEditing.toggle()
                }) {
                    Text(isEditing ? "✅" : "✏️")
                },
            trailing:
                HStack {
                    NavigationLink("➕", destination: AddView())
                }
        )
    }
}
