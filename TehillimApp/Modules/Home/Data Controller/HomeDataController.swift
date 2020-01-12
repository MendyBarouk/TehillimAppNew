//
//  HomeDataController.swift
//  TehillimApp
//
//  Created by Mendy Barouk on 12/01/2020.
//  Copyright © 2020 Mendy Barouk. All rights reserved.
//

import Foundation

protocol HomeDataControllerProtocol {
    
}

protocol HomeDataControllerDelegate: NSObjectProtocol {
    
}

class HomeDataController {
    
    private weak var delegate: HomeDataControllerDelegate?
    
    init(delegate: HomeDataControllerDelegate) {
        self.delegate = delegate
    }
}

extension HomeDataController: HomeDataControllerProtocol {
    
}

