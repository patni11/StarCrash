//
//  IAPService.swift
//  Star Crash
//

import Foundation
import StoreKit
class IAPService:NSObject{
    private override init(){}
        static let shared = IAPService()
    
    var products = [SKProduct]()
    let paymentQueue = SKPaymentQueue.default()
    func getProducts(){
        let products: Set = [IAPProducts.consumable.rawValue,IAPProducts.consumable2.rawValue,IAPProducts.consumable3.rawValue,IAPProducts.consumable4.rawValue,IAPProducts.nonConsumable.rawValue]
        let request = SKProductsRequest(productIdentifiers: products)
        request.delegate = self as SKProductsRequestDelegate
        request.start()
        paymentQueue.add(self)
    }

    func purchase(product: IAPProducts){
        guard let productToPurchase = products.filter({$0.productIdentifier == product.rawValue}).first else{return}
        let payment = SKPayment(product: productToPurchase)
        paymentQueue.add(payment)
        
    }
}


extension IAPService:SKProductsRequestDelegate{
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        self.products = response.products
        for product in response.products{
            print(product.localizedDescription)
        }
    }
    
        
    }
extension IAPService:SKPaymentTransactionObserver{
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions{
              print(transaction.transactionState)
            print(transaction.transactionState.status(),transaction.payment.productIdentifier)
        }
        
    }
}
extension SKPaymentTransactionState{
    func status() -> String{
        switch self{
        case .deferred:return("deferred")
         case .failed:return("failed")
             case .purchased:return("purchased")
             case .purchasing:return("purchasing")
             case .restored:return("restored")
        }
    }
}
