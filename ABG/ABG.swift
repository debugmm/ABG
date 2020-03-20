//
//  ABG.swift
//  ABG
//
//  Created by wujungao on 2020/3/19.
//  Copyright © 2020 com.wujungao. All rights reserved.
//

import Foundation

/// 各个模块之间，总是存在这样 客户:服务（M:N），并且各种服务可以分成两大类：push、pull
/// ABG，用来各个模块之间注册服务，客户注册需要关注的服务

public class ABG {
    //singleton
    public static let shared=ABG.init()
    
    public func registService(service:AnyObject,key:Protocol,cached:Bool = false){
        let pS=NSStringFromProtocol(key)
        if(cached){
            self.map.setObject(service, forKey: NSString.init(string: pS))
        }
        else{
            self.weakMap.setObject(service, forKey: NSString.init(string: pS))
        }
    }
    
    public func getService(key:Protocol) -> AnyObject?{
        let pS=NSStringFromProtocol(key)
        var s=self.map.object(forKey: NSString.init(string: pS))
        if(s==nil){
            s=self.weakMap.object(forKey: NSString.init(string: pS))
        }
        
        return s
    }
    
    public func addTarget(target:AnyObject,keyP:Protocol,keyS:Selector,cached:Bool = false){
        if(cached){
            self.map.setObject(target, forKey: self.convertProtocolActionToString(proto: keyP, action: keyS))
        }
        else{
            self.weakMap.setObject(target, forKey: self.convertProtocolActionToString(proto: keyP, action: keyS))
        }
    }
    
    public func getTarget(keyP:Protocol,keyS:Selector) -> AnyObject?{
        var t=self.map.object(forKey: self.convertProtocolActionToString(proto: keyP, action: keyS))
        if(t==nil){
            t=self.weakMap.object(forKey: self.convertProtocolActionToString(proto: keyP, action: keyS))
        }
        
        return t
    }
        
    //MARK: - private
    private let weakMap:NSMapTable<NSString,AnyObject>
    private let map:NSMapTable<NSString,AnyObject>
    //private init
    private init(){
        self.weakMap=NSMapTable<NSString,AnyObject>.strongToWeakObjects()
        self.map=NSMapTable<NSString,AnyObject>.strongToStrongObjects()
    }
    
    private func convertProtocolActionToString(proto:Protocol,action:Selector) -> NSString{
        let pS=NSStringFromProtocol(proto)
        let aS=NSStringFromSelector(action)
        let keyS=NSString.init(string: pS+aS)
        
        return keyS
    }
}
