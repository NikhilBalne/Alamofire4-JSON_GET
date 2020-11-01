//
//  NetworkingClient.swift
//  JSON_GET
//
//  Created by Nikhil Balne on 28/10/20.
//

import Foundation
import Alamofire

class NetworkingClient: NSObject {
    
    static let networkingClient = NetworkingClient()
    
    func excuteGetServiceCall(url:String, controller:UIViewController, completion: @escaping (_ result: DataResponse<Any>) -> Void) {
        
        print("URL:\(url)")
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON{
                response in
                    completion(response)
            }
    }
}
