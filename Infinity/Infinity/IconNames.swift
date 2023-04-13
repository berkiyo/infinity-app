//
//  IconNames.swift
//  Infinity
//
//  Created by Berk Dogan on 12/4/2023.
//

/**
 IconNames.swift
 - This file is for setting up the functionality of selecting icon names.
 - This will connect to the "ChangeIconView.swift" file
 */

import Foundation
import SwiftUI

class IconNames: ObservableObject {
    var iconNames: [String?] = [nil]
    //exact index we're at inside our icon names
    @Published var currentIndex = 0
    
    init() {
        getAlternateIconNames()
        
        if let currentIcon = UIApplication.shared.alternateIconName{
            self.currentIndex = iconNames.firstIndex(of: currentIcon) ?? 0
        }
}
    
    func getAlternateIconNames(){
    //looking into our info.plist file to locate the specific Bundle with our icons
            if let icons = Bundle.main.object(forInfoDictionaryKey: "CFBundleIcons") as? [String: Any],
                let alternateIcons = icons["CFBundleAlternateIcons"] as? [String: Any]
            {
                     
                 for (_, value) in alternateIcons{
                    //Accessing the name of icon list inside the dictionary
                     guard let iconList = value as? Dictionary<String,Any> else{return}
                     //Accessing the name of icon files
                     guard let iconFiles = iconList["CFBundleIconFiles"] as? [String]
                         else{return}
                         //Accessing the name of the icon
                     guard let icon = iconFiles.first else{return}
                     iconNames.append(icon)
        
                 }
            }
    }
}
