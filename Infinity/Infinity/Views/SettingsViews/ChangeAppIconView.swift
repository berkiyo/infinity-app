// All working nicely!
// Huge thanks to --> https://www.avanderlee.com/swift/alternate-app-icon-configuration-in-xcode/

import SwiftUI


struct ChangeAppIconView: View {
    @StateObject var viewModel = ChangeAppIconViewModel()

    var body: some View {
        VStack {
            Text("Custom App Icon Picker!")
                .font(.title.bold())
                .padding(.bottom, 22)
            
            ScrollView {
                VStack(spacing: 11) {
                    ForEach(ChangeAppIconViewModel.AppIcon.allCases) { appIcon in
                        HStack(spacing: 16) {
                            Image(uiImage: appIcon.preview)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                                .cornerRadius(12)
                            Text(appIcon.description)
                                .font(.body)
                            Spacer()
                            //CheckboxView(isSelected: viewModel.selectedAppIcon == appIcon)
                        }
                        .padding(EdgeInsets(top: 14, leading: 16, bottom: 14, trailing: 16))
                        .background(.thinMaterial)
                        .cornerRadius(20)
                        .onTapGesture {
                            withAnimation {
                                viewModel.updateAppIcon(to: appIcon)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 40)
            }
        }
    }
}



