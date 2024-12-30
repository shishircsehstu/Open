//
//  ViewController.swift
//  ImproveMent
//
//  Created by Md Saddam Hossain on 28.12.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Create views
        let view1 = UIView()
        view1.backgroundColor = .red
        view1.translatesAutoresizingMaskIntoConstraints = false
        
        let view2 = UIView()
        view2.backgroundColor = .blue
        view2.translatesAutoresizingMaskIntoConstraints = false
        
        // Add views to the superview
        view.addSubview(view1)
        view.addSubview(view2)
        
        // Add constraints to view1
        NSLayoutConstraint.activate([
            view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 210),
            view1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            view1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            view1.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // Add constraints to view2
        NSLayoutConstraint.activate([
            view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 20),
            view2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            view2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            view2.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        let button = UIButton(type: .system)
        button.setTitle("Center Button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        view1.addSubview(button)
        
        let button2 = UIButton(type: .system)
        button2.setTitle("Center Button", for: .normal)
        button2.translatesAutoresizingMaskIntoConstraints = false
        view2.addSubview(button2)
        
        // Center the button in view1
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view1.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view1.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            button2.topAnchor.constraint(equalTo: view2.topAnchor, constant: 0), // 10 pixels from the top
            button2.centerXAnchor.constraint(equalTo: view2.centerXAnchor), // Vertically centered in view2
            button2.widthAnchor.constraint(equalToConstant: 150),
            button2.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
}

