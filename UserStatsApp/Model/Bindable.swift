//
//  Bindable.swift
//  UserStatsApp
//
//  Created by Manjula Pajaniraja on 03/03/21.
//

import Foundation

class Bindable<T> {
    var value: T? {
        didSet {
            observer?(self.value)
        }
    }
    
    var observer: ((T?) -> ())?
    
    func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer
    }
}
