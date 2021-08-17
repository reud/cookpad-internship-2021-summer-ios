//
//  CarState.swift
//  MiniMart
//
//  Created by reud on 2021/08/17.
//

import Foundation
import Combine

final class CartState: ObservableObject {
    @Published var products: [FetchProductsQuery.Data.Product] = []
}


