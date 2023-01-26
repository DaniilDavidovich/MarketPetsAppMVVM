//
//  File.swift
//  Home Work 16 (MVVM)
//
//  Created by Daniil Davidovich on 25.01.23.
//

import Foundation

class Box<T> {
    typealias Listener = (T) -> ()

    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }

    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }

    init(setValue value: T) {
        self.value = value
    }
}
