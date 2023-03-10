//
//  HomeViewController.swift
//  osrs-checker-app
//
//  Created by José Matela Neto on 09/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    //TODO: create a UIImage to display OSRS logo
    
    lazy var nameTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        
        textField.placeholder = "Enter a player name here"
        
        return textField
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        activityIndicator.center = self.view.center
        activityIndicator.color = .gray
        activityIndicator.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        
        activityIndicator.startAnimating()
        
        return activityIndicator
    }()
    
    lazy var searchButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Search hiscore", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(HomeViewController.searchPlayerHiscore), for: .touchUpInside)
        
        return button
    }()
    
    var viewModel = HiscoreViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.viewModel.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.restoreUI()
    }
    
    @objc func searchPlayerHiscore() {
        guard let name = self.nameTextField.text, !name.isEmpty else {
            //MARK: TODO - create one alert to shows the error
            print("ta errado")
            return
        }
        self.setupActivityIndicator()
        self.viewModel.getHiscore(name: name)
    }
    
    private func setupUI() {
        self.view.backgroundColor = .gray
        
        self.view.addSubview(self.nameTextField)
        self.view.addSubview(self.searchButton)
        
        self.setupConstraints()
    }
    
    private func setupActivityIndicator() {
        self.view.addSubview(self.activityIndicator)
        
        self.setupActivityIndicatorConstraints()
        
        self.searchButton.isEnabled = false
        self.nameTextField.isUserInteractionEnabled = false
    }
    
    private func restoreUI() {
        self.activityIndicator.removeFromSuperview()
        
        self.searchButton.isEnabled = true
        self.nameTextField.isUserInteractionEnabled = true
    }
    
    private func setupActivityIndicatorConstraints() {
        NSLayoutConstraint.activate([
            self.activityIndicator.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.activityIndicator.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.activityIndicator.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.activityIndicator.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.nameTextField.heightAnchor.constraint(equalToConstant: 40),
            self.nameTextField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 36),
            self.nameTextField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -36),
            self.nameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.nameTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            self.searchButton.heightAnchor.constraint(equalToConstant: 60),
            self.searchButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 60),
            self.searchButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -60),
            self.searchButton.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 24),
            
        ])
    }
}

extension HomeViewController: HiscoreViewModelDelegate {
    func getHiscorePlayer(hasItem: Bool) {
        if hasItem {
            DispatchQueue.main.async {
                let controller = ViewController()
                controller.viewModel = self.viewModel
                self.navigationController?.pushViewController(controller, animated: true)
            }
        } else {
            //MARK: TODO - create a alert to show why is not possible to show the hiscore screen
            print("passa n senhor")
        }
    }
}
