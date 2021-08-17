//
//  CarState.swift
//  MiniMart
//
//  Created by reud on 2021/08/17.
//

import Foundation
import Combine

extension Array {

    func mapToSet<T: Hashable>(_ transform: (Element) -> T) -> Set<T> {
        var result = Set<T>()
        for item in self {
            result.insert(transform(item))
        }
        return result
    }

}

public struct ProductCounted {
    var product:FetchProductsQuery.Data.Product
    var count:Int
    init(product: FetchProductsQuery.Data.Product,count: Int) {
        self.product = product
        self.count = count
    }
}

final class CartState: ObservableObject {
    @Published var products: [FetchProductsQuery.Data.Product] = []
    func aggregate() -> [ProductCounted] {
        let nameSet = products.mapToSet({$0.name})
        return nameSet.map {
            let name = $0
            let sameEl = self.products.filter {
                name == $0.name
            }
            let count = sameEl.count
            let product = sameEl[0]
            return ProductCounted(product: product, count: count)
        }
    }
    
    func cost() -> Int {
        var sum = 0
        for p in self.products {
            sum += p.price
        }
        return sum
    }
}


