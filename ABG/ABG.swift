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
    
    func registService(service:NSObjectProtocol,key:Protocol){
        let abgK=ABGKey.init(proto: key)
        
        self.map.setObject(service, forKey: abgK)
    }
    
    func getService(key:Protocol) -> NSObjectProtocol?{
        let abgkey=ABGKey.init(proto: key)
        let s=self.map.object(forKey: abgkey)
        
        guard let ss = s as? NSObjectProtocol else{
            return nil
        }
        
        return ss
    }
    
    func addTarget(target:NSObjectProtocol,keyP:Protocol,keyS:Selector){
        let keyAction=ABGActionKey.init(proto: keyP, action: keyS)
        self.map.setObject(target, forKey: keyAction)
    }
    
    func getTarget(keyP:Protocol,keyS:Selector) -> NSObjectProtocol?{
        let keyAction=ABGActionKey.init(proto: keyP, action: keyS)
        let t=self.map.object(forKey: keyAction)
        
        guard let tt = t as? NSObjectProtocol else{
            return nil
        }
        
        return tt
    }
    
    func getTargets(key:Protocol){
        
    }
    
    //MARK: - private
    private let map:NSMapTable<ABGKey,AnyObject>
    //private init
    private init(){
        self.map=NSMapTable<ABGKey,AnyObject>.strongToWeakObjects()
    }
}

//MARK: - ABG key
class ABGKey: Hashable{
    
    var keyProto:String
    var proto:Protocol
    
    init(proto:Protocol) {
        self.proto=proto
        self.keyProto=NSStringFromProtocol(proto)
    }
    
    //MARK: - Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.keyProto)
    }
        
    static func == (lhs: ABGKey, rhs: ABGKey) -> Bool {
        var lhsHasher=Hasher()
        var rhsHasher=Hasher()
        
        lhs.hash(into: &lhsHasher)
        rhs.hash(into: &rhsHasher)
        
        return lhsHasher.finalize() == rhsHasher.finalize()
    }
}

class ABGActionKey: ABGKey{
    
    var keyAction:String
    var action:Selector
    
    init(proto:Protocol,action:Selector) {
        self.action=action
        self.keyAction=NSStringFromSelector(action)
        super.init(proto: proto)
    }
    
    //MARK: - Hashable
    override func hash(into hasher: inout Hasher) {
        hasher.combine(self.keyProto)
        hasher.combine(self.keyAction)
    }
        
    static func == (lhs: ABGActionKey, rhs: ABGActionKey) -> Bool {
        var lhsHasher=Hasher()
        var rhsHasher=Hasher()
        
        lhs.hash(into: &lhsHasher)
        rhs.hash(into: &rhsHasher)
        
        return lhsHasher.finalize() == rhsHasher.finalize()
    }
}
