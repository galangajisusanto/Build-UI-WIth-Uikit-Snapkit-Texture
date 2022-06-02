//
//  SnapKitViewController.swift
//  Build UI WIth Snapkit Texture
//
//  Created by MEKARI on 01/06/22.
//

import UIKit
import SnapKit
import SwiftUI

class SnapKitViewController: UIViewController {
    
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
        navigationController?.navigationBar.topItem?.title = "SnapKit Change Data"
        setupContraints()
        setupTable()
    }
    
    private func setupContraints() {
        requestButton.snp.makeConstraints{ make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(46)
        }
        
        changeDataTable.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(requestButton.snp.top).inset(-16)
        }
    }
    
    private func setupTable() {
        changeDataTable.dataSource = self
        changeDataTable.delegate = self
        changeDataTable.register(ChangeDataCellWithSnapKit.self, forCellReuseIdentifier: changeDataCellId)
    }
}

extension SnapKitViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return changesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: changeDataCellId, for: indexPath) as? ChangeDataCellWithSnapKit else {return UITableViewCell()}
        cell.changeDataModel = changesData[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}

struct SnapKitViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            SnapKitViewController()
        }
    }
}



