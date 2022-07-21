//
//  Product: Companies
//
//  Created by Volkan Kuday on 7/21/22 10:59 AM.
//  Copyright © 2022. All rights reserved.
//


import UIKit

class CreateCompanyController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Create Company"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        
        view.backgroundColor = .yellow
    }
    
    @objc private func handleCancel() {
        dismiss(animated: true)
    }
}
