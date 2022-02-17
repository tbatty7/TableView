//
//  MyCollectionViewController.swift
//  TableView
//
//  Created by Timothy D Batty on 2/16/22.
//

import UIKit

private let reuseIdentifier = "Cell"

class MyCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        self.collectionView.register(MyCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override func loadView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

        layout.itemSize = CGSize(width: 60, height: 60)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
//        layout.sectionInset = UIEdgeInsets()
        layout.minimumInteritemSpacing = 0

//        layout.scrollDirection = .horizontal
        self.view = nil
//        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: createBasicListLayout())
    }
    
    func createBasicListLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
      
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .absolute(40))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                         subitems: [item])
      
        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    init(text: String) {
        super.init(nibName: nil, bundle: nil)
        print("Started CollectionViewController \(text)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? MyCell else {
            return UICollectionViewCell()
        }
        cell.setup()
    
        return cell
    }
}

class MyCell: UICollectionViewCell {
    private(set) var label: UILabel = UILabel()

    func setup() {
        label.text = "Hello"
        label.textColor = .blue
        self.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        activateEqualConstraints(.bottom, fromItem: label, toItem: contentView)
        activateEqualConstraints(.left, fromItem: label, toItem: contentView)
    }
    private func activateEqualConstraints(_ attribute: NSLayoutConstraint.Attribute,
                                          fromItem: UIView,
                                          toItem: UIView) {
        NSLayoutConstraint(item: fromItem, attribute: attribute, relatedBy: .greaterThanOrEqual, toItem: toItem, attribute: attribute, multiplier: 1, constant: 0)
            .isActive = true
    }
}
