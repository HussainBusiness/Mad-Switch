//
//  ViewController.swift
//  SwitchMad
//
//  Created by Hussain Mostafa Al Haddad on 17/01/2023.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var Instructions: UILabel!
    
    @IBOutlet weak var congrats: UILabel!
    
    
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    @IBOutlet weak var switch3: UISwitch!
    @IBOutlet weak var switch4: UISwitch!
    @IBOutlet weak var switch5: UISwitch!
    
    @IBOutlet weak var topLeftImageView: UIImageView!
    
    @IBOutlet weak var topRightImageView: UIImageView!
    
    @IBOutlet weak var bottomLeftImageView: UIImageView!
    
    @IBOutlet weak var bottomRightImageView: UIImageView!
    
    
    let headerStackView = UIStackView()
    let switchStackView = UIStackView()
    let pictureStackView = UIStackView()
    
    let info = ["Information about Kuwait!",
                "Kuwait is a country in Western Asia.",
                "In 1521, kuwait was a defensive settlement for the Portuguese.",
                "The bay of Kuwait was colonized by the ancient Greeks under Alexander the Great.",
                "Most of present-day Kuwait is still archaeologically unexplored."
                ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Instructions.text = " Turn on all  switches"
        Instructions.sizeToFit()
        congrats.text = info[0]
        congrats.sizeToFit()
        congrats.numberOfLines = 0
       // congrats.isHidden = true
        
        
       setUpImages()
        style()
        layout()
    }
    
    func setUpImages(){
        
        topLeftImageView.image = UIImage(named: "topLeft")
        topRightImageView.image = UIImage(named: "topRight")
        bottomLeftImageView.image = UIImage(named: "bottomLeft")
        bottomRightImageView.image = UIImage(named: "bottomRight")
        
        bottomLeftImageView.isHidden = true
        bottomRightImageView.isHidden = true
        topLeftImageView.isHidden = true
        topRightImageView.isHidden = true

    }
    
    func style(){
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        switchStackView.translatesAutoresizingMaskIntoConstraints = false
        pictureStackView.translatesAutoresizingMaskIntoConstraints = false
        
        topLeftImageView.translatesAutoresizingMaskIntoConstraints = false
        bottomLeftImageView.translatesAutoresizingMaskIntoConstraints = false
        topRightImageView.translatesAutoresizingMaskIntoConstraints = false
        bottomRightImageView.translatesAutoresizingMaskIntoConstraints = false
        
        congrats.translatesAutoresizingMaskIntoConstraints = false
        
        headerStackView.axis = .vertical
        switchStackView.axis = .vertical
        
        headerStackView.spacing = 20
        switchStackView.spacing = 20
        
        
        headerStackView.distribution = .fillProportionally
        pictureStackView.distribution = .fillEqually
       
    }
    
  

    func layout(){
        
        headerStackView.addSubview(Instructions)
        headerStackView.addSubview(congrats)
        
        pictureStackView.addSubview(topLeftImageView)
        pictureStackView.addSubview(bottomLeftImageView)
        pictureStackView.addSubview(topRightImageView)
        pictureStackView.addSubview(bottomRightImageView)

        
        view.addSubview(headerStackView)
        view.addSubview(pictureStackView)

    
        NSLayoutConstraint.activate([
            
            congrats.leadingAnchor.constraint(equalTo: headerStackView.leadingAnchor, constant: 2),
            congrats.trailingAnchor.constraint(equalTo: headerStackView.trailingAnchor, constant: 2),
            congrats.bottomAnchor.constraint(equalTo: headerStackView.bottomAnchor),
            congrats.centerXAnchor.constraint(equalTo: headerStackView.centerXAnchor),
            
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 2),
            headerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            switch1.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 2),
            switch2.topAnchor.constraint(equalTo: switch1.bottomAnchor, constant: 2),
            switch3.topAnchor.constraint(equalTo: switch2.bottomAnchor, constant: 2),
            switch4.topAnchor.constraint(equalTo: switch3.bottomAnchor, constant: 2),
            switch5.topAnchor.constraint(equalTo: switch4.bottomAnchor, constant: 2),
            
            topRightImageView.leadingAnchor.constraint(equalTo: topLeftImageView.trailingAnchor),
            bottomRightImageView.leadingAnchor.constraint(equalTo: bottomLeftImageView.trailingAnchor),
            
            bottomLeftImageView.topAnchor.constraint(equalTo: topLeftImageView.bottomAnchor),
            
            bottomRightImageView.topAnchor.constraint(equalTo: topRightImageView.bottomAnchor),
            
            pictureStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pictureStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pictureStackView.topAnchor.constraint(equalTo: switch5.bottomAnchor, constant: 1)

        ])
        
    }
    
    
    @IBAction func didSwitch1(_ sender: UISwitch) {
        if switch2.isOn == true{
            switch1.isOn = sender.isOn
            congrats.text = info[2]
            bottomRightImageView.isHidden = false
        }else {
            switch1.reset()
            switch2.reset()
            switch3.reset()
            switch4.reset()
            switch5.reset()
            congrats.text = info[0]
            topLeftImageView.isHidden = true
        }
    }
    
    @IBAction func didSwitch2(_ sender: UISwitch) {
        switch2.isOn = sender.isOn
        congrats.text = info[1]
        topLeftImageView.isHidden = false
    }
    
    @IBAction func didSwitch3(_ sender: UISwitch) {
        if switch2.isOn == true && switch2.isOn == true && switch4.isOn == true{
            switch3.isOn = sender.isOn
            congrats.text = info[4]
            topRightImageView.isHidden = false
        }else {
            switch1.reset()
            switch2.reset()
            switch3.reset()
            switch4.reset()
            switch5.reset()
            congrats.text = info[0]
            bottomLeftImageView.isHidden = true
        }
       
    }
    
    @IBAction func didSwitch4(_ sender: UISwitch) {
        if switch1.isOn == true && switch2.isOn == true{
            switch4.isOn = sender.isOn
            congrats.text = info[3]
            bottomLeftImageView.isHidden = false
        }else {
            switch1.reset()
            switch2.reset()
            switch3.reset()
            switch4.reset()
            switch5.reset()
            congrats.text = info[0]
            bottomRightImageView.isHidden = true
        }
    }
    
    @IBAction func didSwitch5(_ sender: UISwitch) {
       
        if switch2.isOn == true && switch2.isOn == true && switch4.isOn == true && switch3.isOn == true{
            switch5.isOn = sender.isOn
            congrats.text = "Congratulations!"
        }else {
            switch1.reset()
            switch2.reset()
            switch3.reset()
            switch4.reset()
            switch5.reset()
            congrats.text = info[0]
        }
    }
    
}

