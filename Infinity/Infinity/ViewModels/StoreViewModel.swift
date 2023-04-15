//
//  StoreViewModel.swift
//  Infinity
//
//  Created by Berk Dogan on 15/4/2023.
//
// Huge thanks "Just another dang how to channel" for the guide (see: https://www.youtube.com/watch?v=vk6B79dE3Lw)


import Foundation
import StoreKit

typealias RenewalState = StoreKit.Product.SubscriptionInfo.RenewalState

class StoreViewModel: ObservableObject {
    // infinity.pro.yearly
    // infinity.pro.monthly
    
    @Published private(set) var subscriptions: [Product] = []
    @Published private(set) var purchasedSubscriptions: [Product] = []
    @Published private(set) var subscriptionGroupStatus: RenewalState?
    
    private let productIDs: [String] = ["infinity.pro.yearly", "infinity.pro.monthly"]
    
    var updateListenerTask: Task<Void, Error>? = nil
    
    init() {
        
        updateListenerTask = listenForTransactions()
        // once this class is loaded, we want to request the products
        
        Task {
            await requestProducts()
            await updateCustomerProductStatus()
        }
        
    }
    
    deinit {
        updateListenerTask?.cancel()
    } // close listener when closing app
    
    
    /**
     Listener to see if the payment has actually gone through (e.g. family auth)
     */
    
    func listenForTransactions() -> Task<Void, Error> {
        return Task.detached {
            // Iterate through any transactions that don't come from a direct call to "purchase()"
            
            for await result in Transaction.updates {
                do {
                    let transaction = try self.checkVerified(result)
                    
                    // deliver products to user
                    
                    await self.updateCustomerProductStatus()
                    
                    await transaction.finish()
                } catch {
                    print("Transaction Failed Verification, please try again.")
                }
            }
        }
    }
    
    
    // Request the products
    @MainActor
    func requestProducts() async {
        do {
            subscriptions = try await Product.products(for: productIDs)
            print(subscriptions)
        } catch {
            print("Failed product request from app store server: \(error)")
        }
    }
    
    
    
    func purchase(_ product: Product) async throws -> Transaction? {
        let result = try await product.purchase()
        
        switch result {
        
        case .success(let verification):
            
            let transaction = try checkVerified(verification) // if transaction is valid, go for it
            
            await updateCustomerProductStatus() // deliver to customer
            
            await transaction.finish()
            
            
            return transaction
        
        case .userCancelled, .pending:
            return nil
            
        default:
            return nil
        }
    }
    
    func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified:
            // StoreKit parses the JWS, but it fails verification
            throw StoreError.failedVerification
            
        case .verified(let safe):
            // The result is verified, return the unrapped value
            return safe
        }
    }
    
    
    @MainActor
    func updateCustomerProductStatus() async {
        for await result in Transaction.currentEntitlements {
            do {
                // check whether the transaction is verified
                let transaction = try checkVerified(result)
                
                switch transaction.productType {
                    case .autoRenewable:
                        if let subscription = subscriptions.first(where: {$0.id == transaction.productID}) {
                            purchasedSubscriptions.append(subscription)
                        }
                default:
                    break
                }
                
                // always finish transaction
                await transaction.finish()
            } catch {
                print("Failed updating products")
            }
        }
    }
}


public enum StoreError: Error {
    case failedVerification
}
