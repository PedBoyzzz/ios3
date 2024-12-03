//
//  ApiService.swift
//  Project16
//
//  Created by Niwat on 25/6/2567 BE.
//

import Foundation
import Alamofire
class ApiService:ApiPattern{
    func getAmazonProducts(url: String, params: [String : String], result: @escaping ([Product]) -> ()) {
        AF.request(url).response { response in
            /*do {
                let r = try JSONDecoder().decode([Product].self, from:response.data!)
                result(r)
            
            }
            catch {
                print("error \(response.error)")
            }
            */
            switch(response.result){
                case .success(let d):
                    do {
                        let r = try JSONDecoder().decode([Product].self, from:d!)
                        result(r)
                    }
                    catch {
                        print("error ")
                    }
                case .failure(let error):
                    print("------- error \(error)")
                /*case .success:
                    print("------- success2")
                    print("")*/
            }
            
        }
    }
}
