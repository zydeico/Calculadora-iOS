//
//  HomeViewController.swift
//  iOS Calculator
//
//  Created by Daniel Vázquez on 6/27/19.
//  Copyright © 2019 Bit Freelancer. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    // MARK: - Outlets
    // Result
    @IBOutlet weak var resultLabel: UILabel!
    
    // Numbers
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var numberDecimal: UIButton!
    
    // Operators
    @IBOutlet weak var operatorAC: UIButton!
    @IBOutlet weak var operatorPlusMinus: UIButton!
    @IBOutlet weak var operatorPercent: UIButton!
    @IBOutlet weak var operatorResult: UIButton!
    @IBOutlet weak var operatorAddition: UIButton!
    @IBOutlet weak var operatorSubstraction: UIButton!
    @IBOutlet weak var operatorMultiplication: UIButton!
    @IBOutlet weak var operatorDivision: UIButton!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: UI Button
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        
        operatorAC.round()
        operatorPlusMinus.round()
        operatorPercent.round()
        operatorResult.round()
        operatorAddition.round()
        operatorSubstraction.round()
        operatorMultiplication.round()
        operatorDivision.round()
    }
    // MARK: Actions
    // AC
    @IBAction func operatorAcAction(_ sender: UIButton) {
        sender.shine()
    }
    // +/-
    @IBAction func operatorPlusMinus(_ sender: UIButton) {
        sender.shine()
    }
    // Porcentaje
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        sender.shine()
    }
    // Resultado
    @IBAction func operatorResultAction(_ sender: UIButton) {
        sender.shine()
    }
    // Mas
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        sender.shine()
    }
    // Menos
    @IBAction func operatorSubstractionAction(_ sender: UIButton) {
        sender.shine()
    }
    // Multiplicación
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        sender.shine()
    }
    // División
    @IBAction func operatorDivitionAction(_ sender: UIButton) {
        sender.shine()
    }
    // Coma
    @IBAction func operationSeparatorAction(_ sender: UIButton) {
        sender.shine()
    }
    
    // MARK: Number Action
    @IBAction func numberAction(_ sender: UIButton) {
        
        print(sender.tag)
    }
}
