//
//  ApiPattern.swift
//  Project16
//
//  Created by Niwat on 25/6/2567 BE.
//

import Foundation
protocol ApiPattern{
    func getAmazonProducts(url:String,params:[String:String],result:@escaping([Product])->())
}
