//
//  UIkitViewController.swift
//  Build UI WIth Snapkit Texture
//
//  Created by MEKARI on 31/05/22.
//

import UIKit
import SwiftUI

class UIKitViewController: UIViewController {
    
    private lazy var changeDataTable: UITableView = {
        let tabel = UITableView()
        view.addSubview(tabel)
        return tabel
    }()
    
    private lazy var requestButton: UIButton = {
        let button = UIButton(type: .custom)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBlue
        button.setTitle("Request change data", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        view.addSubview(button)
        return button
    }()
    
    private let changeDataCellId = "change data cell id"
    private var changesData = ChangeDataManager.generateChangesData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.topItem?.title = "UIKit Change Data"
        setupContraints()
        setupTable()
    }
    
    private func setupContraints() {
        requestButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            requestButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            requestButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:20),
            requestButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-20),
            requestButton.heightAnchor.constraint(equalToConstant: 46)
        ])
        
        changeDataTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            changeDataTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            changeDataTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            changeDataTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            changeDataTable.bottomAnchor.constraint(equalTo: requestButton.topAnchor, constant: -16)
        ])
    }
    
    private func setupTable() {
        changeDataTable.dataSource = self
        changeDataTable.delegate = self
        changeDataTable.register(ChangeDataCell.self, forCellReuseIdentifier: changeDataCellId)
    }
}

extension UIKitViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return changesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: changeDataCellId, for: indexPath) as? ChangeDataCell else {return UITableViewCell()}
        cell.changeDataModel = changesData[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}

struct UIKitViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            UIKitViewController()
        }
    }
}



