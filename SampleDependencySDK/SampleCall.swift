//
//  SampleCall.swift
//  SampleDependencySDK
//
//  Created by Jose Miguel Benedicto Ruiz on 12/12/2017.
//  Copyright © 2017 Jose Miguel Benedicto Ruiz. All rights reserved.
//

import Foundation
import Alamofire

public class SampleCall {
    
    public init() {
    
    }
    
    public func call(completion: @escaping (String) -> ()) {
        let event = GAIDictionaryBuilder.createEvent(
            withCategory: "category",
            action: "action",
            label: "label",
            value: nil).build() as [NSObject:AnyObject]
        
        GAI.sharedInstance().tracker(withTrackingId: "UA-90546882-2")?.send(event)
        
        Alamofire
            .request("https://httpbin.org/get")
            .response(completionHandler: { (response) in
                completion(response
                    .data
                    .flatMap{ String(data: $0, encoding: .utf8) } ?? "Error")
            })
    }
}

