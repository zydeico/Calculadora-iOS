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
    
    // MARK: - Variables
    private var total: Double = 0 // Variables para mostrar el total
    private var temp: Double = 0 // Valor por pantalla
    private var operating: Bool = false // Indicar si hemos seleccionado un operador
    private var decimal: Bool = false // Indicar si el valor es decimal
    private var operation: OperationType = .none // Operación Actual
    
    // MARK: - Constantes
    private let kDecimalSeparator = Locale.current.decimalSeparator!
    private let kMaxLenght = 9
    private let kMaxValue: Double = 999999999
    private let kMinValue: Double = 0.00000001
    
    private enum OperationType {
        case none, addiction, substraction, multiplication, division, percent
    }
    
    // Formateador de valores auxiliar
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    // Formateo de vaolres por pantalla por defecto
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    
    // Formateo de valopers por pantalla en formato cienfífico
    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
        return formatter
    }()
    
    // MARK: - Initializer
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
        numberDecimal.round()
        
        operatorAC.round()
        operatorPlusMinus.round()
        operatorPercent.round()
        operatorResult.round()
        operatorAddition.round()
        operatorSubstraction.round()
        operatorMultiplication.round()
        operatorDivision.round()
        
        numberDecimal.setTitle(kDecimalSeparator, for: .normal)
        
        result()
    }
    
    // MARK: Actions
    
    // AC
    @IBAction func operatorAcAction(_ sender: UIButton) {
        clear()
        sender.shine()
    }
    
    // +/-
    @IBAction func operatorPlusMinus(_ sender: UIButton) {
        temp = temp * (-1)
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    
    // Porcentaje
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        if operation != .percent {
            result()
        }
        operating = true
        operation = .percent
        result()
        sender.shine()
    }
    
    // Resultado
    @IBAction func operatorResultAction(_ sender: UIButton) {
        result()
        sender.shine()
    }
    
    // Suma
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .addiction
        sender.shine()
    }
    
    // Resta
    @IBAction func operatorSubstractionAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .substraction
        
        sender.shine()
    }
    
    // Multiplicación
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .multiplication
        
        sender.shine()
    }
    
    // División
    @IBAction func operatorDivitionAction(_ sender: UIButton) {
        result()
        operating = true
        operation = .division
        
        sender.shine()
    }
    
    // Coma o decimal
    @IBAction func operationSeparatorAction(_ sender: UIButton) {
        let currenTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !operating && currenTemp.count >= kMaxLenght {
            return
        }
        resultLabel.text = resultLabel.text! + kDecimalSeparator
        decimal = true
        sender.shine()
    }
    
    // MARK: Number Action
    @IBAction func numberAction(_ sender: UIButton) {
        operatorAC.setTitle("C", for: .normal)
        var currenTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !operating && currenTemp.count >= kMaxLenght {
            return
        }
        
        // Verificar la selección de la operación
        if operating {
            total = total == 0 ? temp : total
            resultLabel.text = ""
            currenTemp = ""
            operating = false
        }
        if decimal {
            currenTemp = "\(currenTemp)\(kDecimalSeparator)"
            decimal = false
        }
        let number = sender.tag
        temp = Double(currenTemp + String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        print(sender.tag)
        sender.shine()
    }
    
    // Función para limpiar los datos de pantalla
    private func clear() {
        operation = .none
        operatorAC.setTitle("AC", for: .normal)
        if temp != 0 {
            temp = 0
            resultLabel.text = "0"
        } else {
            total = 0
            result()
        }
    }
    
    // Función para obtener el resultado final
    private func result() {
        switch operation {
        case .none:
            break
        case .addiction:
            total = total + temp
            break
        case .substraction:
            total = total - temp
            break
        case .multiplication:
            total = total * temp
            break
        case .division:
            total = total / temp
            break
        case .percent:
            temp = temp / 100
            total = temp
            break
        }
        
        // Formateo en pantalla
        if total <= kMaxValue || total >= kMinValue {
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        print("Total: \(total)")
    }
    
}
