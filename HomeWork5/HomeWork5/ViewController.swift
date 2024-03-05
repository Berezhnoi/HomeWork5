//
//  ViewController.swift
//  HomeWork5
//
//  Created by rendi on 05.03.2024.
//

import UIKit

class ViewController: UIViewController {
    let containerView = UIView();
    let loginTextField = UITextField();
    let passwordTextField = UITextField();
    let loginButton = UIButton(type: .system);
    let registrationButton = UIButton(type: .system);
    
    let margin: CGFloat = 20;
    let textFieldHeight: CGFloat = 40;
    let buttonHeight: CGFloat = 40;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        setupContainerView();
        setupLoginTextField();
        setupPasswordTextField();
        setupLoginButton();
        setupRegistrationButton();
    }
    
    /// Set up the layout constraints for the container view
    func setupContainerView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false;
        view.addSubview(containerView);
        
        let maxWidth = min(view.bounds.width * 0.8, 600);
        let minHeight: CGFloat = 280;
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: maxWidth),
            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: minHeight)
        ]);
    }
    
    /// Configure common properties and layout constraints for text fields
    /// - Parameter textField: The text field to be configured
    func configureTextField(_ textField: UITextField) {
        textField.borderStyle = .roundedRect;
        textField.layer.borderColor = UIColor.lightGray.cgColor;
        textField.layer.borderWidth = 1.0;
        textField.layer.cornerRadius = 4;
        textField.translatesAutoresizingMaskIntoConstraints = false;
        
        // Common constraints for text fields
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: margin),
            textField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -margin),
            textField.heightAnchor.constraint(equalToConstant: textFieldHeight)
        ])
    }
    
    /// Set up the layout and properties for the login text field
    func setupLoginTextField() {
        loginTextField.placeholder = "Username";
        containerView.addSubview(loginTextField);
        configureTextField(loginTextField);
        setupLabel("Username:", textField: loginTextField);
        
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: margin),
        ]);
    }
    
    /// Set up the layout and properties for the password text field
    func setupPasswordTextField() {
        passwordTextField.placeholder = "Password";
        passwordTextField.isSecureTextEntry = true;
        containerView.addSubview(passwordTextField);
        configureTextField(passwordTextField);
        setupLabel("Password:", textField: passwordTextField);
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 30),
        ]);
    }
    
    /// Set up the layout and properties for the labels associated with text fields
    /// - Parameters:
    ///   - text: The text for the label
    ///   - textField: The associated text field
    func setupLabel(_ text: String, textField: UITextField) {
        let label = UILabel();
        label.text = text;
        label.textColor = .lightGray;
        label.translatesAutoresizingMaskIntoConstraints = false;
        containerView.addSubview(label);
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: margin),
            label.heightAnchor.constraint(equalToConstant: 20),
            label.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -2)
        ]);
    }
    
    /// Configure common properties and layout constraints for buttons
    /// - Parameter button: The button to be configured
    func configureButton(_ button: UIButton) {
        button.backgroundColor = UIColor.systemBlue;
        button.setTitleColor(.white, for: .normal);
        button.translatesAutoresizingMaskIntoConstraints = false;
        
        // Common constraints for buttons
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            button.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5),
            button.heightAnchor.constraint(equalToConstant: buttonHeight)
        ])
    }
    
    /// Set up the layout and properties for the login button
    func setupLoginButton() {
        loginButton.setTitle("Login", for: .normal);
        containerView.addSubview(loginButton);
        configureButton(loginButton);
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 34),
        ]);
    }
    
    /// Set up the layout and properties for the registration button
    func setupRegistrationButton() {
        registrationButton.setTitle("Register", for: .normal);
        containerView.addSubview(registrationButton);
        configureButton(registrationButton);
        
        NSLayoutConstraint.activate([
            registrationButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 24),
        ]);
    }
}
