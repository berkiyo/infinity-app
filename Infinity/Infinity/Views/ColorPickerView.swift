import SwiftUI

struct ColorPickerView: View {
    
    @Binding var selectedColor: Color
    private let colors: [Color] = [
        .red, .yellow, .orange, .purple, .blue, .indigo, .green, .mint]
    // 10 items in array
    
    
    var body: some View {
        
        VStack {
            GeometryReader { geometry in
                ScrollView(.horizontal) {
                    HStack(alignment: .center) {
                        ForEach(colors, id: \.self) {
                            color in
                            Circle()
                                .foregroundColor(color)
                                .frame(width: 30, height: 30)
                                .opacity(color == selectedColor ? 0.5 : 1.0)
                                .scaleEffect(color == selectedColor ? 1.1 : 1.0)
                                .onTapGesture {
                                    selectedColor = color
                                }
                        }
                    }
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(20)
                    .frame(width: geometry.size.width)
                }
            }
        }
    }
}
