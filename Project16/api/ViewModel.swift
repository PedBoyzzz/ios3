//
//  ViewModel.swift
//  Project16
//
//  Created by Niwat on 25/6/2567 BE.
//

import Foundation
class ViewModel{
    var apiService:ApiService
    init(apiService:ApiService){
        self.apiService = apiService
        t(s: "----- XXXXX")
    }
    func getAmazonProducts(url: String, params: [String : String], result: @escaping ([Product]) -> ()) {
        apiService.getAmazonProducts(url: url, params: params, result: result)
    }
    func t(s s1:String){
        print("------\(s1)")
    }
}
