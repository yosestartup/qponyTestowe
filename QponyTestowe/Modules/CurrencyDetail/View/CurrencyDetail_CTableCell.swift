//
//  CurrencyDetail_CTableViewCell.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 15/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CurrencyDetail_CTableCell: UITableViewCell {
    
    private var currencyBidLabel: UILabel = UILabel()
    private var currencyAskLabel: UILabel = UILabel()
    private let tableNumberLabel: UILabel = UILabel()
    private var effectiveDateLabel: UILabel = UILabel()
    private let cornerRadius: CGFloat = 12.0.withRatio()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.createUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createUI() {
        
        self.makeShadow()
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
        
        self.contentView.backgroundColor = .clear

        let container = UIView()
        container.backgroundColor = UIColor.white
        container.layer.cornerRadius = self.cornerRadius
        container.layer.masksToBounds = true

        self.contentView.addSubview(container)
        container.addSubview(self.currencyBidLabel)
        container.addSubview(self.currencyAskLabel)
        container.addSubview(self.tableNumberLabel)
        container.addSubview(self.effectiveDateLabel)
        
        container.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(14.withRatio())
            make.right.equalToSuperview().offset(-14.withRatio())
            make.bottom.equalToSuperview().offset(-14.withRatio())
        }
        
        self.currencyBidLabel.font = UIFont.systemFont(ofSize: 16.withRatio(), weight: .medium)
        self.currencyBidLabel.textColor = ColorManager.darkBlue
        self.currencyBidLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(18.withRatio())
            make.left.equalToSuperview().offset(15.withRatio())
        }
        
        self.currencyAskLabel.font = UIFont.systemFont(ofSize: 16.withRatio(), weight: .medium)
        self.currencyAskLabel.textColor = ColorManager.darkBlue
        self.currencyAskLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.currencyBidLabel.snp.bottom).offset(5.withRatio())
            make.left.equalToSuperview().offset(15.withRatio())
        }
        
        self.tableNumberLabel.font = UIFont.systemFont(ofSize: 16.withRatio(), weight: .regular)
        self.tableNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.currencyAskLabel.snp.bottom).offset(15.withRatio())
            make.left.equalToSuperview().offset(15.withRatio())
        }
        
        self.effectiveDateLabel.font = UIFont.systemFont(ofSize: 18.withRatio(), weight: .regular)
        self.effectiveDateLabel.textColor = ColorManager.lightGrey
        self.effectiveDateLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(15.withRatio())
            make.top.equalTo(self.tableNumberLabel.snp.bottom).offset(6.withRatio())
            make.bottom.equalToSuperview().offset(-18.withRatio())
        }
    }
    
    private func makeShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 4.0
    }
}

extension CurrencyDetail_CTableCell {
    func display(_ model: RateC_Model) {
        self.currencyBidLabel.text = "kupno: " + String(model.bid)
        self.currencyAskLabel.text = "sprzedaż: " + String(model.ask)
        self.tableNumberLabel.text = "numer tabeli: " + model.tabelNumber
        self.effectiveDateLabel.text = "publikacja: " + model.effectiveDate
    }
}
