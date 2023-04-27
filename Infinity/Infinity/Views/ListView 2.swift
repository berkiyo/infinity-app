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
                    .environmentObject(listViewModel)
            } else {
                List {
                    ForEach(listViewModel.items) {
                        item in ListRowView(item: item)
                            .onTapGesture {
                                /**
                                 This is currently working as a manual sync button, this will be replaced in time to be automatic and run like a CRON.
                                 */
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item) // update item
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem) // all from "ListViewModel.swift"
                }
                .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
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
                    NavigationLink("➕", destination: AddView().environmentObject(listViewModel))
                }
        )
    }
    

}
