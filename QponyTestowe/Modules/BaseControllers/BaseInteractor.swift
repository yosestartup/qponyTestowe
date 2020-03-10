//
//  BaseInteractor.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

class BaseInteractor {

    var networkController: NetworkRequestProvider! = nil

    init(networkController: NetworkRequestProvider) {
        self.networkController = networkController
    }
}
