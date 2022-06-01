//
//  ChangeDataCell+SnapKit.swift
//  Build UI WIth Snapkit Texture
//
//  Created by MEKARI on 01/06/22.
//

import UIKit
import SnapKit

class ChangeDataCellWithSnapKit: UITableViewCell {
    
    private lazy var titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        addSubview(lbl)
        return lbl
    }()
    
    private lazy var changesLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        addSubview(lbl)
        return lbl
    }()
    
    private lazy var statusLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 1
        addSubview(lbl)
        return lbl
    }()
    
    private lazy var detailButton: UIButton = {
        let button = UIButton(type: .custom)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.setTitle("Detail", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        button.setTitleColor(.gray, for: .normal)
        addSubview(button)
        return button
    }()
    
    var changeDataModel: ChangeDataModel? {
        didSet {
            statusLabel.text = changeDataModel?.status
            titleLabel.text = changeDataModel?.title
            changesLabel.text = "Change to \(changeDataModel?.changeTo ?? "")"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContraints()
    }
    
    private func setupContraints() {
        detailButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
            make .width.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(20)
            make.trailing.equalTo(detailButton.snp.leading).offset(8)
        }
        
        changesLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(detailButton.snp.leading).offset(8)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview().inset(20)
            make.top.equalTo(changesLabel.snp.bottom).offset(8)
            make.trailing.equalTo(detailButton.snp.leading).offset(8)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
