//
//  ViewController.swift
//  Calculator-1
//
//  Created by 한선수 on 2020/05/20.
//  Copyright © 2020 한선수. All rights reserved.
//

import UIKit

class ViewController: UIViewController, KeyPadViewDelegate {

    private let margin: CGFloat = 10
    private let btnNumericBg = ViewController.createUIColor(red: 122, green: 124, blue: 132)
    private let btnOprBg = ViewController.createUIColor(red: 255, green: 175, blue: 0)
    private let calcHelper = CalculationManager()
    private var lb_display: UILabel!
    
    private let displayFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.view.backgroundColor = ViewController.createUIColor(red: 50, green: 50, blue: 50)
        
        let keyPad = self.addKeyPad()
        self.lb_display = self.addLabel_DisplayText(keyPad.topAnchor)
        self.addLabel_Title()
    }
    
    
    private static func createUIColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
    
    
    private func addKeyPad() -> KeyPadView {

//        4 X 4
//        let items = [
//            [
//                ItemInfoSet(displayText: "1", bg: self.btnNumericBg),
//                ItemInfoSet(displayText: "2", bg: self.btnNumericBg),
//                ItemInfoSet(displayText: "3", bg: self.btnNumericBg),
//                ItemInfoSet(displayText: Const.MATH_ADD, bg: self.btnOprBg),
//            ],
//            [
//                ItemInfoSet(displayText: "4", bg: self.btnNumericBg),
//                ItemInfoSet(displayText: "5", bg: self.btnNumericBg),
//                ItemInfoSet(displayText: "6", bg: self.btnNumericBg),
//                ItemInfoSet(displayText: Const.MATH_SUB, bg: self.btnOprBg)
//            ],
//            [
//                ItemInfoSet(displayText: "7", bg: self.btnNumericBg),
//                ItemInfoSet(displayText: "8", bg: self.btnNumericBg),
//                ItemInfoSet(displayText: "9", bg: self.btnNumericBg),
//                ItemInfoSet(displayText: Const.MATH_MULT, bg: self.btnOprBg),
//            ],
//            [
//                ItemInfoSet(displayText: "0", bg: self.btnNumericBg),
//                ItemInfoSet(displayText: Const.MATH_ALLCLEAR, bg: self.btnNumericBg),
//                ItemInfoSet(displayText: Const.MATH_RETURN, bg: self.btnOprBg),
//                ItemInfoSet(displayText: Const.MATH_DIV, bg: self.btnOprBg),
//            ]
//        ]
        
        // 6 X 6
        let items = [
            [
                ItemInfoSet(displayText: "1", bg: self.btnNumericBg),
                ItemInfoSet(displayText: "2", bg: self.btnNumericBg),
                ItemInfoSet(displayText: "3", bg: self.btnNumericBg),
                ItemInfoSet(displayText: Const.MATH_ADD, bg: self.btnOprBg),
                ItemInfoSet(displayText: "", bg: .systemRed),
                ItemInfoSet(displayText: "", bg: .systemRed),
            ],
            [
                ItemInfoSet(displayText: "4", bg: self.btnNumericBg),
                ItemInfoSet(displayText: "5", bg: self.btnNumericBg),
                ItemInfoSet(displayText: "6", bg: self.btnNumericBg),
                ItemInfoSet(displayText: Const.MATH_SUB, bg: self.btnOprBg),
                ItemInfoSet(displayText: "", bg: .systemRed),
                ItemInfoSet(displayText: "", bg: .systemRed),
            ],
            [
                ItemInfoSet(displayText: "7", bg: self.btnNumericBg),
                ItemInfoSet(displayText: "8", bg: self.btnNumericBg),
                ItemInfoSet(displayText: "9", bg: self.btnNumericBg),
                ItemInfoSet(displayText: Const.MATH_MULT, bg: self.btnOprBg),
                ItemInfoSet(displayText: "", bg: .systemRed),
                ItemInfoSet(displayText: "", bg: .systemRed),
            ],
            [
                ItemInfoSet(displayText: "0", bg: self.btnNumericBg),
                ItemInfoSet(displayText: Const.MATH_ALLCLEAR, bg: self.btnNumericBg),
                ItemInfoSet(displayText: Const.MATH_RETURN, bg: self.btnOprBg),
                ItemInfoSet(displayText: Const.MATH_DIV, bg: self.btnOprBg),
                ItemInfoSet(displayText: "", bg: .systemRed),
                ItemInfoSet(displayText: "", bg: .systemRed),
            ],
            [
                ItemInfoSet(displayText: "", bg: .systemRed),
                ItemInfoSet(displayText: "", bg: .systemRed),
                ItemInfoSet(displayText: "", bg: .systemRed),
                ItemInfoSet(displayText: "", bg: .systemRed),
                ItemInfoSet(displayText: "", bg: .systemRed),
                ItemInfoSet(displayText: "", bg: .systemRed),
            ],
            [
                ItemInfoSet(displayText: "", bg: .systemRed),
                ItemInfoSet(displayText: "", bg: .systemRed),
                ItemInfoSet(displayText: "", bg: .systemRed),
                ItemInfoSet(displayText: "", bg: .systemRed),
                ItemInfoSet(displayText: "", bg: .systemRed),
                ItemInfoSet(displayText: "", bg: .systemRed),
            ],
        ]
        
        let keyPad = KeyPadView(items: items, keyPadDelegate: self)
        super.view.addSubview(keyPad)
        
        let safeArea = super.view.safeAreaLayoutGuide
        keyPad.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            keyPad.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: self.margin),
            keyPad.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -self.margin),
            keyPad.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: self.margin)
        ])
        
        return keyPad
    }
    
    private func addLabel_DisplayText(_ bottomAnchorTarget: NSLayoutYAxisAnchor) -> UILabel {
        let lb = UILabel()
        lb.text = "0"
        lb.font = UIFont.systemFont(ofSize: 35, weight: .semibold)
        lb.textColor = Const.DEF_TEXT_COLOR
        lb.textAlignment = .right
        super.view.addSubview(lb)
        
        let safeArea = super.view.safeAreaLayoutGuide
        lb.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lb.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            lb.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            lb.bottomAnchor.constraint(equalTo: bottomAnchorTarget, constant: -15)
        ])
        
        return lb
    }
    
    private func addLabel_Title() {
        let lb = UILabel()
        lb.text = "Calculator"
        lb.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        lb.textColor = Const.DEF_TEXT_COLOR
        lb.textAlignment = .center
        super.view.addSubview(lb)
        
        let safeArea = super.view.safeAreaLayoutGuide
        lb.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lb.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            lb.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            lb.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    
    func buttonTouched(_ sender: UIButton) {
        if let input = sender.titleLabel?.text {
            if let result = self.calcHelper.sendInput(input) {
                self.lb_display.text = self.displayFormatter.string(from: result as NSNumber)
            }
        }
    }
}
