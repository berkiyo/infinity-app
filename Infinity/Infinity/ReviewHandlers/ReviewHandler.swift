//
//  ReviewHandler.swift
//  Infinity
//
//  Created by Berk Dogan on 3/6/2023.
//

import Foundation
import StoreKit
import SwiftUI

class ReviewHandler {
    
    static func requestReview() {
        var count = UserDefaults.standard.integer(forKey: UserDefaultsKeys.appStartUpsCountKey)
        count += 1
        UserDefaults.standard.set(count, forKey: UserDefaultsKeys.appStartUpsCountKey)
        
        let infoDictionaryKey = kCFBundleVersionKey as String
        guard let currentVersion = Bundle.main.object(forInfoDictionaryKey: infoDictionaryKey) as? String
            else { fatalError("Expected to find a bundle version in the info dictionary") }

        let lastVersionPromptedForReview = UserDefaults.standard.string(forKey: UserDefaultsKeys.lastVersionPromptedForReviewKey)
        
        if count >= 4 && currentVersion != lastVersionPromptedForReview {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
                if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                    SKStoreReviewController.requestReview(in: scene)
                }
            }
        }
    }
}
