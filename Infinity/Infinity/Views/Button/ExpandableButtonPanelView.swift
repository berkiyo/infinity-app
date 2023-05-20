//
//  ExpandableButtonPanelView.swift
//  Infinity
//
//  Created by Berk Dogan on 20/5/2023.
//

import SwiftUI

struct ExpandableButtonItem: Identifiable {
  let id = UUID()
  let label: String
  private(set) var action: (() -> Void)? = nil
}

struct ExpandableButtonPanelView: View {

  let primaryItem: ExpandableButtonItem
  let secondaryItems: [ExpandableButtonItem]

  private let noop: () -> Void = {}
  private let size: CGFloat = 75
  private var cornerRadius: CGFloat {
    get { size / 2 }
  }
  private let shadowColor = Color.black.opacity(0.4)
  private let shadowPosition: (x: CGFloat, y: CGFloat) = (x: 2, y: 2)
  private let shadowRadius: CGFloat = 3

  @State private var isExpanded = false

  var body: some View {
    VStack {
      ForEach(secondaryItems) { item in
        Button(item.label, action: item.action ?? self.noop)
          .frame(
            width: self.isExpanded ? self.size : 0,
            height: self.isExpanded ? self.size : 0)
      }

      Button(primaryItem.label, action: {
        withAnimation {
          self.isExpanded.toggle()
        }
        self.primaryItem.action?()
      })
      .frame(width: size, height: size)
    }
    .background(Color(UIColor.systemOrange))
    .cornerRadius(cornerRadius)
    .font(.title)
    .shadow(
      color: shadowColor,
      radius: shadowRadius,
      x: shadowPosition.x,
      y: shadowPosition.y
    )
  }
}
