//
//  TestService.swift
//  ABG-Example
//
//  Created by wujungao on 2020/3/19.
//  Copyright © 2020 com.wujungao. All rights reserved.
//

import UIKit

class TestService:NSObject {
    
    static let shared:TestService=TestService.init()
    
    var context:ABGContext
    
    override private init() {
        self.context=ABGContext.init(parameters: ["testKey":"testValue"])
    }
}

extension TestService:TestProtocol{
    
    func getContext() -> ABGContext {
        return self.context
    }
}
