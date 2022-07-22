//
//  Product: Companies
//
//  Created by Volkan Kuday on 7/21/22 10:59 AM.
//  Copyright © 2022. All rights reserved.
//


import UIKit

protocol CreateCompanyControllerDelegate {
    func didAddCompany(company: Company)
}

class CreateCompanyController: UIViewController {
    
    var delegate: CreateCompanyControllerDelegate?
        
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name"
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter name"
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Create Company"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
        
        view.backgroundColor = .yellow
        
        setupUI()
    }
    
    private func setupUI() {
        let lightBlueBackgroundView = UIView()
        lightBlueBackgroundView.backgroundColor = UIColor.lightBlue
        lightBlueBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lightBlueBackgroundView)
        NSLayoutConstraint.activate([
            lightBlueBackgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            lightBlueBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lightBlueBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lightBlueBackgroundView.heightAnchor.constraint(equalToConstant: view.frame.height / 2)
        ])
        
        lightBlueBackgroundView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: lightBlueBackgroundView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: lightBlueBackgroundView.leadingAnchor, constant: 16),
            nameLabel.widthAnchor.constraint(equalToConstant: 80),
            nameLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        lightBlueBackgroundView.addSubview(nameTextField)
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: lightBlueBackgroundView.trailingAnchor, constant: -16),
            nameTextField.heightAnchor.constraint(equalTo: nameLabel.heightAnchor)
        ])
    }
    
    @objc private func handleSave() {
        dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            guard let name = self.nameTextField.text else { return }
            
            let company = Company(name: name, founded: Date())
            self.delegate?.didAddCompany(company: company)
        }
        
    }
    
    @objc private func handleCancel() {
        dismiss(animated: true)
    }
}
