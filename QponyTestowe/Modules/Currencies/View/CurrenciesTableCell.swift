//
//  CurrencyCell.swift
//  QponyTestowe
//
//  Created by Oleksandr Bambulyak on 11/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CurrenciesTableCell: UITableViewCell {
    
    private var currencyCodeLabel: UILabel = UILabel()
    private var currencyNameLabel: UILabel = UILabel()
    private var currencyMidLabel: UILabel = UILabel()
    private var dateLabel: UILabel = UILabel()
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
        container.addSubview(self.currencyMidLabel)
        container.addSubview(self.dateLabel)
        
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
        
        self.currencyMidLabel.font = UIFont.systemFont(ofSize: 26.withRatio(), weight: .medium)
        self.currencyMidLabel.textColor = ColorManager.darkBlue
        self.currencyMidLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-18.withRatio())
            make.centerY.equalTo(self.currencyCodeLabel.snp.centerY)
        }
        
        self.currencyNameLabel.font = UIFont.systemFont(ofSize: 15.withRatio(), weight: .regular)
        self.currencyNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.currencyCodeLabel.snp.bottom).offset(7.withRatio())
            make.left.equalToSuperview().offset(18.withRatio())
        }
        
        self.dateLabel.font = UIFont.systemFont(ofSize: 18.withRatio(), weight: .regular)
        self.dateLabel.textColor = ColorManager.lightGrey
        self.dateLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(18.withRatio())
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

extension CurrenciesTableCell {
    func display(_ model: CurrencyAB_Model) {
        self.currencyCodeLabel.text = model.code
        self.currencyNameLabel.text = model.currency
        self.currencyMidLabel.text = String(model.mid)
        self.dateLabel.text = model.effectiveDate
    }
}
