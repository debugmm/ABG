//
//  SwiftABG.swift
//  SwiftABG
//
//  Created by wujungao on 2020/3/19.
//  Copyright © 2020 com.wujungao. All rights reserved.
//

import Foundation

/// 各个模块之间，总是存在这样 客户:服务（M:N），并且各种服务可以分成两大类：push、pull
/// SwiftABG，用来各个模块之间注册服务，客户注册需要关注的服务

public class ABG{
    //singleton
    static let shared=ABG.init()
    
    func registService(service:AnyObject,key:Protocol){
        let pS=NSStringFromProtocol(key)
        
        self.map.setObject(service, forKey: NSString.init(string: pS))
    }
    
    func getService(key:Protocol) -> AnyObject?{
        let pS=NSStringFromProtocol(key)
        let s=self.map.object(forKey: NSString.init(string: pS))
        
        return s
    }
    
    func addTarget(target:AnyObject,keyP:Protocol,keyS:Selector){
        self.map.setObject(target, forKey: self.convertProtocolActionToString(proto: keyP, action: keyS))
    }
    
    func getTarget(keyP:Protocol,keyS:Selector) -> AnyObject?{
        let t=self.map.object(forKey: self.convertProtocolActionToString(proto: keyP, action: keyS))
        
        return t
    }
        
    //MARK: - private
    private let map:NSMapTable<NSString,AnyObject>
    //private init
    private init(){
        self.map=NSMapTable<NSString,AnyObject>.strongToWeakObjects()
    }
    
    private func convertProtocolActionToString(proto:Protocol,action:Selector) -> NSString{
        let pS=NSStringFromProtocol(proto)
        let aS=NSStringFromSelector(action)
        let keyS=NSString.init(string: pS+aS)
        
        return keyS
    }
}
