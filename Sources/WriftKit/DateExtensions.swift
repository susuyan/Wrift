//
//  File.swift
//  
//
//  Created by sanmy on 2019/12/18.
//

import Foundation

extension Date {
    static public func now(_ format: String = "yyyy-MM-d") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: Date())
    }
    
}
