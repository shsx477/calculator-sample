//
//  CalculationManager.swift
//  Calculator-1
//
//  Created by 한선수 on 2020/05/21.
//  Copyright © 2020 한선수. All rights reserved.
//

import Foundation

class CalculationManager {
    typealias OPR_TYPE = (Double, Double) -> Double
    
    private let maxLength: Double = pow(10, 12) // 13자리로 제한
    
    private var opd1: Double = 0
    private var opd2: Double?
    private var curOpr: OPR_TYPE?
    private var isReturned = false
    private var lastOpr: OPR_TYPE?
    private var lastOpd2: Double?
    
    
    private func addition(_ val1: Double, _ val2: Double) -> Double { val1 + val2 }
    
    private func subtraction(_ val1: Double, _ val2: Double) -> Double { val1 - val2 }
    
    private func multiplication(_ val1: Double, _ val2: Double) -> Double { val1 * val2 }
    
    private func division(_ val1: Double, _ val2: Double) -> Double { val1 / val2 }
    
    
    private func calculate(_ val1: Double, _ val2: Double, _ oprAct: OPR_TYPE) -> Double { oprAct(val1, val2) }
    
    private func resetAllDatas() {
        self.opd1 = 0
        self.opd2 = nil
        self.curOpr = nil
        self.isReturned = false
    }
    
    
    private func onOperatorReceived(_ selectedOpr: @escaping OPR_TYPE) -> Double? {
        var result: Double?
        
        self.isReturned = false
        self.lastOpr = nil
        self.lastOpd2 = nil
        
        if let val2 = self.opd2 {
            guard let opr = self.curOpr else { fatalError() }
            
            self.opd1 = self.calculate(self.opd1, val2, opr)
            result = self.opd1
            
            self.opd2 = nil
        }
        
        self.curOpr = selectedOpr
        
        return result
    }
    
    private func onReturnReceived() -> Double? {
        var result: Double?
        
        if let val2 = self.opd2 {
            guard let opr = self.curOpr else { fatalError() }
            
            self.opd1 = self.calculate(self.opd1, val2, opr)
            result = self.opd1
            
            self.lastOpr = opr
            self.lastOpd2 = val2
            self.curOpr = nil
            self.opd2 = nil
            
        } else if let opr = self.curOpr {
            self.opd1 = self.calculate(self.opd1, self.opd1, opr)
            result = self.opd1
            
            self.resetAllDatas()
            
        } else if let lastVal2 = self.lastOpd2, let lastOpr = self.lastOpr{
            self.opd1 = self.calculate(self.opd1, lastVal2, lastOpr)
            result = self.opd1
        }
        
        self.isReturned = true
        
        return result
    }
    
    private func onClearReeived() -> Double? {
        self.resetAllDatas()
        return 0
    }
    
    private func onNumericReceived(_ input: String) -> Double? {
        var result: Double?
        
        if let inputNumeric = Double(input) {
            
            self.lastOpr = nil
            self.lastOpd2 = nil
            
            if self.isReturned {
                self.opd1 = 0
                self.isReturned = false
            }
            
            if self.curOpr == nil {
                if (self.opd1 / self.maxLength) < 1 {
                    self.opd1 = (self.opd1 * 10) + inputNumeric
                    result = self.opd1
                }
                
            } else {
                if ((self.opd2 ?? 0) / self.maxLength) < 1 {
                    self.opd2 = ((self.opd2 ?? 0) * 10) + inputNumeric
                    result = self.opd2
                }
            }
        }
        
        return result
    }
    
    
    func sendInput(_ input: String) -> Double? {
        var result: Double?
        
        switch input {
        case Const.MATH_ADD:        result = self.onOperatorReceived(self.addition)
        case Const.MATH_SUB:        result = self.onOperatorReceived(self.subtraction)
        case Const.MATH_MULT:       result = self.onOperatorReceived(self.multiplication)
        case Const.MATH_DIV:        result = self.onOperatorReceived(self.division)
        case Const.MATH_RETURN:     result = self.onReturnReceived()
        case Const.MATH_ALLCLEAR:   result = self.onClearReeived()
        default:                    result = self.onNumericReceived(input)
        }
        
        return result
    }
}
