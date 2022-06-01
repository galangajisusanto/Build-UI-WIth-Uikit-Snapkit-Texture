//
//  ChangeDataCell.swift
//  Build UI WIth Snapkit Texture
//
//  Created by MEKARI on 01/06/22.
//

import UIKit

class ChangeDataCell: UITableViewCell {
    
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
        
        detailButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            detailButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            detailButton.heightAnchor.constraint(equalToConstant: 40),
            detailButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: detailButton.leadingAnchor, constant: -8)
        ])
        
        changesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            changesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            changesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant:20),
            changesLabel.trailingAnchor.constraint(equalTo: detailButton.leadingAnchor, constant: -8)
        ])
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: changesLabel.bottomAnchor, constant: 8),
            statusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant:20),
            statusLabel.trailingAnchor.constraint(equalTo: detailButton.leadingAnchor, constant: -8),
            statusLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
