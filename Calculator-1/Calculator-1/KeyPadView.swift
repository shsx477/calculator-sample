//
//  KeyPadView.swift
//  Calculator-1
//
//  Created by 한선수 on 2020/05/20.
//  Copyright © 2020 한선수. All rights reserved.
//

import UIKit

protocol KeyPadViewDelegate {
    func buttonTouched(_ sender: UIButton)
}

struct ItemInfoSet {
    let displayText: String
    let bg: UIColor
}

class KeyPadView: UIView {
    private let btnMargin: CGFloat = 8
    private var sizeRefView: UIView!
    private var btnWidthOffset: CGFloat = 0
    private var btnMultiplier: CGFloat = 1
    private var btnArr = [[UIButton]]()
    private var delegate: KeyPadViewDelegate?
    
    
    init(items: [[ItemInfoSet]], keyPadDelegate: KeyPadViewDelegate) {

        let rowCnt = items.count
        let colCnt = items[0].count
        let targetCnt = rowCnt > colCnt ? rowCnt : colCnt
        
        let cnt: CGFloat = CGFloat(exactly: targetCnt)!
        self.btnWidthOffset = -(((cnt - 1) * self.btnMargin) / cnt)
        self.btnMultiplier = 1 / cnt
        
        self.delegate = keyPadDelegate
        
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        
        for item in items {
            let btns = item.map { _  in UIButton() }
            self.btnArr.append(btns)
        }
        
        for (row, itemInfos) in items.enumerated() {
            switch row {
            case 0:
                for (col, itemInfo) in itemInfos.enumerated() {
                    switch col {
                    case 0:                     self.setFirstRow_FirstColumn(itemInfo, row, col)
                    case itemInfos.count - 1:   self.setFirstRow_LastColumn(itemInfo, row, col)
                    default:                    self.setFirstRow_MiddleColumn(itemInfo, row, col)
                    }
                }
            case items.count - 1:
                for (col, itemInfo) in itemInfos.enumerated() {
                    switch col {
                    case 0:                     self.setLastRow_FirstColumn(itemInfo, row, col)
                    case itemInfos.count - 1:   self.setLastRow_LastColumn(itemInfo, row, col)
                    default:                    self.setLastRow_MiddleColumn(itemInfo, row, col)
                    }
                }
            default:
                for (col, itemInfo) in itemInfos.enumerated() {
                    switch col {
                    case 0:                     self.setMiddleRow_FirstColumn(itemInfo, row, col)
                    case itemInfos.count - 1:   self.setMiddleRow_LastColumn(itemInfo, row, col)
                    default:                    self.setMiddleRow_MiddleColumn(itemInfo, row, col)
                    }
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    @objc private func btnTouched(_ sender: UIButton) { self.delegate?.buttonTouched(sender) }
    
    
    private func getButton(_ row: Int, _ col: Int) -> UIButton? {
        var btn: UIButton?
        
        if row <= self.btnArr.count {
            let rowArr = self.btnArr[row]
            
            if col <= rowArr.count {
                btn = rowArr[col]
            }
        }
        
        return btn
    }
    
    private func initButton(_ btn: UIButton, _ title: String, _ bg: UIColor) {
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(Const.DEF_TEXT_COLOR, for: .normal)
        
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        btn.backgroundColor = bg
        btn.contentHorizontalAlignment = .center
        btn.contentVerticalAlignment = .center
        
        btn.addTarget(self, action: #selector(self.btnTouched(_:)), for: .touchUpInside)
    }
    
    
    // MARK: first row
    
    private func setFirstRow_FirstColumn(_ itemInfo: ItemInfoSet, _ row: Int, _ col: Int) {
        if let btn = self.getButton(row, col) {
            self.initButton(btn, itemInfo.displayText, itemInfo.bg)
            super.addSubview(btn)
            
            btn.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                btn.topAnchor.constraint(equalTo: super.topAnchor),
                btn.leadingAnchor.constraint(equalTo: super.leadingAnchor),
                btn.widthAnchor.constraint(equalTo: super.widthAnchor, multiplier: self.btnMultiplier, constant: self.btnWidthOffset),
                btn.heightAnchor.constraint(equalTo: btn.widthAnchor)
            ])
            
            self.sizeRefView = btn
        }
    }
    
    private func setFirstRow_LastColumn(_ itemInfo: ItemInfoSet, _ row: Int, _ col: Int) {
        if let btn = self.getButton(row, col),
            let btn_leading = self.getButton(row, col - 1) {
            
            self.initButton(btn, itemInfo.displayText, itemInfo.bg)
            super.addSubview(btn)
            
            btn.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                btn.topAnchor.constraint(equalTo: super.topAnchor),
                btn.leadingAnchor.constraint(equalTo: btn_leading.trailingAnchor, constant: self.btnMargin),
                btn.trailingAnchor.constraint(equalTo: super.trailingAnchor),
                btn.widthAnchor.constraint(equalTo: self.sizeRefView.widthAnchor),
                btn.heightAnchor.constraint(equalTo: btn.widthAnchor)
            ])
        }
    }
    
    private func setFirstRow_MiddleColumn(_ itemInfo: ItemInfoSet, _ row: Int, _ col: Int) {
        if let btn = self.getButton(row, col),
            let btn_leading = self.getButton(row, col - 1) {
            
            self.initButton(btn, itemInfo.displayText, itemInfo.bg)
            super.addSubview(btn)
            
            btn.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                btn.topAnchor.constraint(equalTo: super.topAnchor),
                btn.leadingAnchor.constraint(equalTo: btn_leading.trailingAnchor, constant: self.btnMargin),
                btn.widthAnchor.constraint(equalTo: self.sizeRefView.widthAnchor),
                btn.heightAnchor.constraint(equalTo: btn.widthAnchor)
            ])
        }
    }
    
    // MARK: last row
    
    private func setLastRow_FirstColumn(_ itemInfo: ItemInfoSet, _ row: Int, _ col: Int) {
        if let btn = self.getButton(row, col),
            let btn_top = self.getButton(row - 1, col) {
            
            self.initButton(btn, itemInfo.displayText, itemInfo.bg)
            super.addSubview(btn)
            
            btn.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                btn.topAnchor.constraint(equalTo: btn_top.bottomAnchor, constant: self.btnMargin),
                btn.leadingAnchor.constraint(equalTo: super.leadingAnchor),
                btn.bottomAnchor.constraint(equalTo: super.bottomAnchor),
                btn.widthAnchor.constraint(equalTo: self.sizeRefView.widthAnchor),
                btn.heightAnchor.constraint(equalTo: btn.widthAnchor)
            ])
        }
    }
    
    private func setLastRow_LastColumn(_ itemInfo: ItemInfoSet, _ row: Int, _ col: Int) {
        if let btn = self.getButton(row, col),
            let btn_top = self.getButton(row - 1, col),
            let btn_leading = self.getButton(row, col - 1) {
            
            self.initButton(btn, itemInfo.displayText, itemInfo.bg)
            super.addSubview(btn)
            
            btn.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                btn.topAnchor.constraint(equalTo: btn_top.bottomAnchor, constant: self.btnMargin),
                btn.leadingAnchor.constraint(equalTo: btn_leading.trailingAnchor, constant: self.btnMargin),
                btn.trailingAnchor.constraint(equalTo: super.trailingAnchor),
                btn.bottomAnchor.constraint(equalTo: super.bottomAnchor),
                btn.widthAnchor.constraint(equalTo: self.sizeRefView.widthAnchor),
                btn.heightAnchor.constraint(equalTo: btn.heightAnchor)
            ])
        }
    }
    
    private func setLastRow_MiddleColumn(_ itemInfo: ItemInfoSet, _ row: Int, _ col: Int) {
        if let btn = self.getButton(row, col),
            let btn_top = self.getButton(row - 1, col),
            let btn_leading = self.getButton(row, col - 1) {
            
            self.initButton(btn, itemInfo.displayText, itemInfo.bg)
            super.addSubview(btn)
            
            btn.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                btn.topAnchor.constraint(equalTo: btn_top.bottomAnchor, constant: self.btnMargin),
                btn.leadingAnchor.constraint(equalTo: btn_leading.trailingAnchor, constant: self.btnMargin),
                btn.bottomAnchor.constraint(equalTo: super.bottomAnchor),
                btn.widthAnchor.constraint(equalTo: self.sizeRefView.widthAnchor),
                btn.heightAnchor.constraint(equalTo: btn.widthAnchor)
            ])
        }
    }
    
    // MARK: middle row
    
    private func setMiddleRow_FirstColumn(_ itemInfo: ItemInfoSet, _ row: Int, _ col: Int) {
        if let btn = self.getButton(row, col),
            let btn_top = self.getButton(row - 1, col) {
            
            self.initButton(btn, itemInfo.displayText, itemInfo.bg)
            super.addSubview(btn)
            
            btn.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                btn.topAnchor.constraint(equalTo: btn_top.bottomAnchor, constant: self.btnMargin),
                btn.leadingAnchor.constraint(equalTo: super.leadingAnchor),
                btn.widthAnchor.constraint(equalTo: self.sizeRefView.widthAnchor),
                btn.heightAnchor.constraint(equalTo: btn.widthAnchor)
            ])
        }
    }
    
    private func setMiddleRow_LastColumn(_ itemInfo: ItemInfoSet, _ row: Int, _ col: Int) {
        if let btn = self.getButton(row, col),
            let btn_top = self.getButton(row - 1, col),
            let btn_leading = self.getButton(row, col - 1) {
            
            self.initButton(btn, itemInfo.displayText, itemInfo.bg)
            super.addSubview(btn)
            
            btn.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                btn.topAnchor.constraint(equalTo: btn_top.bottomAnchor, constant: self.btnMargin),
                btn.leadingAnchor.constraint(equalTo: btn_leading.trailingAnchor, constant: self.btnMargin),
                btn.trailingAnchor.constraint(equalTo: super.trailingAnchor),
                btn.widthAnchor.constraint(equalTo: self.sizeRefView.widthAnchor),
                btn.heightAnchor.constraint(equalTo: btn.widthAnchor)
            ])
        }
    }
    
    private func setMiddleRow_MiddleColumn(_ itemInfo: ItemInfoSet, _ row: Int, _ col: Int) {
        if let btn = self.getButton(row, col),
            let btn_top = self.getButton(row - 1, col),
            let btn_leading = self.getButton(row, col - 1) {
            
            self.initButton(btn, itemInfo.displayText, itemInfo.bg)
            super.addSubview(btn)
            
            btn.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                btn.topAnchor.constraint(equalTo: btn_top.bottomAnchor, constant: self.btnMargin),
                btn.leadingAnchor.constraint(equalTo: btn_leading.trailingAnchor, constant: self.btnMargin),
                btn.widthAnchor.constraint(equalTo: self.sizeRefView.widthAnchor),
                btn.heightAnchor.constraint(equalTo: btn.widthAnchor)
            ])
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        super.subviews.forEach { $0.layer.cornerRadius = $0.frame.width / 2 }
    }
}
