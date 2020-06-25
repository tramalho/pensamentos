//
//  Settings.swift
//  Pensamentos
//
//  Created by Thiago Antonio Ramalho on 21/06/20.
//  Copyright © 2020 Tramalho. All rights reserved.
//

import Foundation

enum UserDefaultKeys: String {
    case timeInverval = "timeInverval"
    case colorScheme  = "colorScheme"
    case autoRefresh  = "autoRefresh"
}

class Settings {
    
    let shared = UserDefaults.standard
    static var shared = Settings()
    
    var timeInverval:Double {
        
        get {
            return shared.double(forKey: UserDefaultKeys.timeInverval.rawValue)
        }
        
        set {
            shared.set(newValue, forKey: UserDefaultKeys.timeInverval.rawValue)
        }
    }
    
    var colorScheme:Int {
        
        get {
            return shared.integer(forKey: UserDefaultKeys.colorScheme.rawValue)
        }
        
        set {
            shared.set(newValue, forKey: UserDefaultKeys.colorScheme.rawValue)
        }
    }
    
    var autoRefresh:Bool {
        
        get {
            return shared.bool(forKey: UserDefaultKeys.autoRefresh.rawValue)
        }
        
        set {
            shared.set(newValue, forKey: UserDefaultKeys.autoRefresh.rawValue)
        }
    }
    
    private init() {
        if timeInverval == 0 {
            timeInverval = 10
        }
    }
}
