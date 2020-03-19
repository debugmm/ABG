//
//  main.swift
//  ABG
//
//  Created by wujungao on 2020/3/19.
//  Copyright © 2020 com.wujungao. All rights reserved.
//

import UIKit

let argc = CommandLine.argc // Swift 3 把 Process改为CommandLine 了
let argv = UnsafeMutablePointer<UnsafeMutablePointer<Int8>>.allocate(capacity: Int(CommandLine.argc))

UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil,NSStringFromClass(AppDelegate.self))
