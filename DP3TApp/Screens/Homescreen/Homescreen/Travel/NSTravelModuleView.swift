/*
 * Copyright (c) 2020 Ubique Innovation AG <https://www.ubique.ch>
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * SPDX-License-Identifier: MPL-2.0
 */

import UIKit

class NSTravelModuleView: NSModuleBaseView {
    private let infoView: UIView = {
        let view = UIView()
        let imageView = NSImageView(image: UIImage(named: "ic-travel"), dynamicColor: .ns_blue)
        let titleLabel = NSLabel(.textLight, textColor: .ns_purpleText, numberOfLines: 0, textAlignment: .natural)
        titleLabel.text = "homescreen_travel_description"
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        imageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(NSPadding.medium)
            make.bottom.lessThanOrEqualToSuperview().inset(NSPadding.medium)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(NSPadding.medium + 3.0)
            make.leading.equalTo(imageView.snp.trailing).offset(NSPadding.medium)
            make.trailing.bottom.equalToSuperview().inset(NSPadding.medium)
        }
        imageView.setContentHuggingPriority(UILayoutPriority(rawValue: 260), for: .horizontal)
        imageView.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 760), for: .horizontal)

        view.backgroundColor = .ns_blueBackground
        view.layer.cornerRadius = 3.0
        return view
    }()

    override func sectionViews() -> [UIView] {
        return [infoView]
    }

    override init() {
        super.init()

        headerTitle = "homescreen_travel_title".ub_localized

        updateLayout()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}