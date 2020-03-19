//
//  TestProtocol.swift
//  ABG-Example
//
//  Created by wujungao on 2020/3/19.
//  Copyright © 2020 com.wujungao. All rights reserved.
//

import Foundation

@objc protocol TestProtocol{
    
    @objc optional func getContext() -> ABGContext
}
