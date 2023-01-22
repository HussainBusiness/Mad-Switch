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
    
    let headerStackView = UIStackView()
    let switchStackView = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Instructions.text = " Turn on all  switches"
        Instructions.sizeToFit()
        congrats.text = "Congratulations!"
        congrats.sizeToFit()
        congrats.isHidden = true
        
       
        style()
        layout()
    }
    
    func style(){
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        switchStackView.translatesAutoresizingMaskIntoConstraints = false
        
        headerStackView.axis = .vertical
        switchStackView.axis = .vertical
        
        headerStackView.spacing = 20
        switchStackView.spacing = 20
        
        headerStackView.distribution = .fillProportionally
       
    }
    
  

    func layout(){
        
        headerStackView.addSubview(Instructions)
        headerStackView.addSubview(congrats)
        
        
        
        view.addSubview(headerStackView)
        

    
        NSLayoutConstraint.activate([
            headerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 2),
            headerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            switch1.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: 2),
            switch2.topAnchor.constraint(equalTo: switch1.bottomAnchor, constant: 2),
            switch3.topAnchor.constraint(equalTo: switch2.bottomAnchor, constant: 2),
            switch4.topAnchor.constraint(equalTo: switch3.bottomAnchor, constant: 2),
            switch5.topAnchor.constraint(equalTo: switch4.bottomAnchor, constant: 2),

            
         
        ])
        
    }
    
    
    @IBAction func didSwitch1(_ sender: UISwitch) {
        if switch2.isOn == true{
            switch1.isOn = sender.isOn
            
        }else {
            switch1.reset()
            switch2.reset()
            switch3.reset()
            switch4.reset()
            switch5.reset()
        }
    }
    
    @IBAction func didSwitch2(_ sender: UISwitch) {
        switch2.isOn = sender.isOn
    }
    
    @IBAction func didSwitch3(_ sender: UISwitch) {
        if switch2.isOn == true && switch2.isOn == true && switch4.isOn == true{
            switch3.isOn = sender.isOn

        }else {
            switch1.reset()
            switch2.reset()
            switch3.reset()
            switch4.reset()
            switch5.reset()
        }
       
    }
    
    @IBAction func didSwitch4(_ sender: UISwitch) {
        if switch1.isOn == true && switch2.isOn == true{
            switch4.isOn = sender.isOn
        }else {
            switch1.reset()
            switch2.reset()
            switch3.reset()
            switch4.reset()
            switch5.reset()
        }
    }
    
    @IBAction func didSwitch5(_ sender: UISwitch) {
       
        if switch2.isOn == true && switch2.isOn == true && switch4.isOn == true && switch3.isOn == true{
            switch5.isOn = sender.isOn
            congrats.isHidden = false
        }else {
            switch1.reset()
            switch2.reset()
            switch3.reset()
            switch4.reset()
            switch5.reset()
        }
    }
    
}

