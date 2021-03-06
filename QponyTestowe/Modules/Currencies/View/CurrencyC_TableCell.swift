//
//  CurrencyCTableCell.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 14/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CurrencyC_TableCell: UITableViewCell {
    
    private var currencyCodeLabel: UILabel = UILabel()
    private var currencyNameLabel: UILabel = UILabel()
    private var currencyBidLabel: UILabel = UILabel()
    private var currencyAskLabel: UILabel = UILabel()
    private var tradingDateLabel: UILabel = UILabel()
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
        container.addSubview(self.currencyCodeLabel)
        container.addSubview(self.currencyNameLabel)
        container.addSubview(self.currencyBidLabel)
        container.addSubview(self.currencyAskLabel)
        container.addSubview(self.tradingDateLabel)
        container.addSubview(self.effectiveDateLabel)
        
        container.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(14.withRatio())
            make.right.equalToSuperview().offset(-14.withRatio())
            make.bottom.equalToSuperview().offset(-14.withRatio())
        }
        
        self.currencyCodeLabel.font = UIFont.systemFont(ofSize: 41.withRatio(), weight: .semibold)
        self.currencyCodeLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(18.withRatio())
            make.left.equalToSuperview().offset(15.withRatio())
        }
        
        self.currencyAskLabel.font = UIFont.systemFont(ofSize: 16.withRatio(), weight: .medium)
        self.currencyAskLabel.textColor = ColorManager.darkBlue
        self.currencyAskLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-18.withRatio())
            make.bottom.equalTo(self.currencyCodeLabel.snp.bottom)
        }
        
        self.currencyBidLabel.font = UIFont.systemFont(ofSize: 16.withRatio(), weight: .medium)
        self.currencyBidLabel.textColor = ColorManager.darkBlue
        self.currencyBidLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-18.withRatio())
            make.bottom.equalTo(self.currencyAskLabel.snp.top).offset(-4.withRatio())
        }
        
        self.currencyNameLabel.font = UIFont.systemFont(ofSize: 15.withRatio(), weight: .regular)
        self.currencyNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.currencyCodeLabel.snp.bottom).offset(7.withRatio())
            make.left.equalToSuperview().offset(18.withRatio())
        }
        
        self.effectiveDateLabel.font = UIFont.systemFont(ofSize: 14.withRatio(), weight: .regular)
        self.effectiveDateLabel.textColor = ColorManager.lightGrey
        self.effectiveDateLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(18.withRatio())
            make.top.equalTo(self.currencyNameLabel.snp.bottom).offset(6.withRatio())
            make.bottom.equalToSuperview().offset(-18.withRatio())
        }
        
        self.tradingDateLabel.font = UIFont.systemFont(ofSize: 14.withRatio(), weight: .regular)
        self.tradingDateLabel.textColor = ColorManager.lightGrey
        self.tradingDateLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-18.withRatio())
            make.top.equalTo(self.currencyNameLabel.snp.bottom).offset(6.withRatio())
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

extension CurrencyC_TableCell {
    func display(_ model: CurrencyC_Model) {
        self.currencyCodeLabel.text = model.code
        self.currencyNameLabel.text = model.currency
        self.currencyBidLabel.text = "kupno: " + String(model.bid)
        self.currencyAskLabel.text = "sprzedaż: " + String(model.ask)
        self.effectiveDateLabel.text = "publikacja: " + String(model.effectiveDate)
        self.tradingDateLabel.text = "notowanie: " + String(model.tradingDate)
    }
}
