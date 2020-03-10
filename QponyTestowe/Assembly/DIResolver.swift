//
//  ProfilesDIResolver.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 10/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

// MARK: - DIResolver
class DIResolver {

    let networkController: NetworkRequestProvider

    // MARK: - Init
    init(networkController: NetworkRequestProvider) {
        self.networkController = networkController
    }

}
