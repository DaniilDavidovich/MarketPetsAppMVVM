//
//  File.swift
//  Home Work 16 (MVVM)
//
//  Created by Daniil Davidovich on 26.01.23.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func addItemAndReloadCollection(item: Model)
}

class ViewModel {
    
    var data = ModelData()
    
    weak var delegate: ViewModelDelegate?
}
