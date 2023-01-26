//
//  ViewModel.swift
//  Home Work 16 (MVVM)
//
//  Created by Daniil Davidovich on 25.01.23.
//

import UIKit

final class ViewModel {
    
    var model: Box<[[Model]]> = Box(setValue: ModelData().modelsData)
}
