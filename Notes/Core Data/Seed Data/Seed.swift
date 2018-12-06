//
//  Seed.swift
//  Notes
//
//  Created by Oluwatobi Omotayo on 06/12/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import Foundation

struct Seed {
    
    // MARK: - Seed Data
    
    var tags: [String] {
        return [
            "Tips and Tricks",
            "Libraries",
            "Programming",
            "Apple",
            "WWDC",
            "News"
        ]
    }
    
    var categories: [(name: String, colorAsHex: String)] {
        return [
            (name: "Core Data", colorAsHex: "F6D14E"),
            (name: "Swift", colorAsHex: "5A765B"),
            (name: "iOS", colorAsHex: "292B34"),
            (name: "tvOS", colorAsHex: "F2F2F2"),
            (name: "macOS", colorAsHex: "CD3227"),
            (name: "watchOS", colorAsHex: "E99057"),
            (name: "Xcode", colorAsHex: "101410"),
            (name: "Objective-C", colorAsHex: "4483F3")
        ]
    }
    
    var notes: [(title: String, createdAt: Double, updatedAt: Double, category: String, tags: [String])] {
        return [
            (title: "Getting Started With Core Data",                               createdAt: 1518011139, updatedAt: 1518011139, category: "Swift",       tags: ["Tips and Tricks"]),
            (title: "Welcome to Cocoacasts",                                        createdAt: 1517987097, updatedAt: 1517987097, category: "iOS",         tags: ["Libraries"]),
            (title: "Five Tips to Become a Better Swift Developer",                 createdAt: 1517963055, updatedAt: 1517963055, category: "Xcode",       tags: ["Libraries"]),
            (title: "Three Podcasts for Developers",                                createdAt: 1517939013, updatedAt: 1517939013, category: "Xcode",       tags: ["Tips and Tricks", "Libraries", "Programming", "Apple"]),
            (title: "What Is a Singleton and How To Create One In Swift",           createdAt: 1517914971, updatedAt: 1517914971, category: "Swift",       tags: ["Programming"]),
            (title: "Managing View Controllers With Container View Controllers",    createdAt: 1517890929, updatedAt: 1517890929, category: "watchOS",     tags: ["Programming"]),
            (title: "Reading and Updating Managed Objects With Core Data",          createdAt: 1517866887, updatedAt: 1517866887, category: "Objective-C", tags: ["Apple"]),
            (title: "Nuts and Bolts of Dependency Injection in Swift",              createdAt: 1517842845, updatedAt: 1517842845, category: "tvOS",        tags: ["Tips and Tricks", "Programming", "Patterns"]),
            (title: "Mastering MVVM With Swift",                                    createdAt: 1517818803, updatedAt: 1517818803, category: "Swift",       tags: ["Patterns"]),
            (title: "Core Data Fundamentals",                                       createdAt: 1517794761, updatedAt: 1517794761, category: "Swift",       tags: ["News"])
        ]
    }
    
    var contents: [String] {
        return [
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec lacinia risus. Etiam suscipit elementum semper. Nunc gravida cursus pretium. Curabitur ultricies arcu sit amet porttitor rhoncus. Praesent eget convallis nibh, et malesuada nibh. Suspendisse potenti. Nulla id efficitur odio, vitae gravida erat. Nulla at eros a erat auctor venenatis. Nunc lectus libero, euismod eget nisi non, elementum scelerisque odio. Aliquam nec hendrerit sapien. Quisque ut dui posuere, malesuada libero et, vulputate purus. Quisque iaculis enim a faucibus hendrerit. Cras elementum vestibulum vestibulum. Nulla faucibus, leo quis lobortis euismod, leo sem ullamcorper justo, ac cursus metus elit vel orci. Aenean ac mi sollicitudin nisl lobortis dignissim. Vivamus facilisis mauris id nisl vulputate pretium.",
            "Nunc velit turpis, commodo quis turpis quis, maximus aliquam odio. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis quis quam risus. Duis pretium magna eu imperdiet finibus. In semper erat ac elit rhoncus, et tempor quam aliquet. Suspendisse ullamcorper dolor sed pulvinar lobortis. Nam neque felis, rhoncus et lectus quis, ultricies bibendum magna. Pellentesque a dignissim metus, id faucibus metus. Nullam aliquet magna eu velit accumsan, sed aliquet metus euismod. Cras mauris libero, ultrices ut neque ut, dictum auctor diam. Etiam eu consequat nulla. Suspendisse placerat sit amet arcu sed tempus. Praesent eros lorem, molestie in lorem quis, congue scelerisque metus.",
            "Etiam pellentesque fringilla lacus id malesuada. Integer vitae dolor quam. Integer porta tincidunt ipsum, pulvinar porta velit sollicitudin eget. Proin dictum, risus at convallis tincidunt, justo diam congue magna, id condimentum velit nulla et massa. Donec luctus magna sed lacus semper, a varius lacus rhoncus. Nam consectetur mauris sit amet tellus posuere, vel pulvinar justo efficitur. Maecenas luctus porta metus. Vestibulum nunc mauris, vestibulum et accumsan ut, tempor sit amet neque. Donec vestibulum lobortis consequat. Proin a elit interdum, porta odio quis, cursus est. Praesent sit amet pulvinar elit. In elementum quam malesuada finibus tincidunt. Fusce commodo luctus hendrerit. In at arcu non nulla ultricies euismod. Cras malesuada malesuada enim, vitae tristique orci suscipit nec.",
            "Curabitur purus odio, mattis nec ullamcorper eget, vestibulum vitae libero. Vestibulum eleifend, dui non vestibulum porttitor, sem sem rutrum felis, vel imperdiet mi urna eget ipsum. Nulla id lectus dignissim, hendrerit lorem non, suscipit ligula. Etiam lacinia sagittis est. Etiam maximus ante vitae lacus tempor condimentum. Curabitur enim libero, placerat a mauris posuere, imperdiet rutrum odio. Donec iaculis pulvinar risus, bibendum blandit nisi mollis vitae. Vestibulum at imperdiet risus, quis elementum purus. Integer interdum risus sem, eu ultricies augue lacinia id. Proin mattis semper mattis. Integer rutrum turpis mi. Duis consequat id orci non scelerisque. Cras sed eros vitae leo sagittis auctor ut quis leo. Vivamus in leo risus. Suspendisse orci purus, placerat lacinia augue mattis, rutrum dapibus mi. Interdum et malesuada fames ac ante ipsum primis in faucibus.",
            "Sed finibus aliquam cursus. Nam tempor gravida enim ac ullamcorper. Quisque rhoncus tellus ac turpis laoreet consectetur. Duis ornare vulputate faucibus. Morbi laoreet libero eu viverra interdum. Nam accumsan bibendum sapien, ut tincidunt libero varius at. Nulla sapien massa, euismod nec rhoncus eu, cursus sit amet purus. Vestibulum dapibus bibendum felis, a ornare lorem. Donec in lobortis ex, viverra sodales lorem. Morbi pretium, tortor et commodo lacinia, ipsum risus eleifend nulla, et maximus odio libero non arcu. Donec vestibulum tincidunt justo sed ullamcorper. Aenean nibh velit, hendrerit nec elementum sit amet, suscipit et metus. Integer sit amet turpis mauris. Aliquam viverra sed nulla vel imperdiet. Cras non pellentesque turpis, sed interdum tortor. Vivamus placerat arcu id neque accumsan, non viverra odio porta.",
            "Vestibulum eleifend metus at nunc porta, scelerisque consectetur augue ornare. Suspendisse mauris dui, fringilla nec posuere fringilla, vulputate quis arcu. Quisque ullamcorper tincidunt nulla vel consectetur. Ut massa ipsum, varius quis nulla in, iaculis molestie augue. Mauris et sodales lorem. Vivamus eu est iaculis urna faucibus pretium dignissim sed arcu. Nulla feugiat dui orci.",
            "Donec nisi enim, euismod non malesuada condimentum, ullamcorper in velit. Cras hendrerit sit amet nunc eget feugiat. Mauris accumsan facilisis erat, condimentum faucibus leo accumsan id. Cras accumsan elementum diam, vel ultrices quam placerat vitae. Aliquam ligula urna, condimentum eu semper sit amet, vehicula vel diam. Sed nec lectus ac augue porta tincidunt. Praesent tempus ac urna vitae lacinia. Vestibulum consectetur justo non turpis rutrum, id eleifend lacus bibendum. Maecenas luctus metus lorem, vitae dictum erat fermentum ac. Cras auctor vitae eros id venenatis. Sed rhoncus rhoncus hendrerit. Ut quis eros euismod mauris finibus ullamcorper sit amet a ipsum. Sed vitae pulvinar lectus.",
            "Donec dolor ipsum, iaculis eget mi ut, auctor pretium nisl. Nullam ante libero, lacinia non leo at, feugiat commodo massa. Morbi congue scelerisque arcu, id interdum ante pretium non. Suspendisse in condimentum lacus. Sed mattis nulla a est commodo, vitae sagittis nisl viverra. Integer tincidunt tempor lacinia. Donec convallis blandit dapibus. Nullam a ipsum tristique, dapibus libero vel, convallis neque. Sed posuere lacinia augue, id volutpat lorem tristique nec. Nunc id erat vitae justo porttitor feugiat. Morbi iaculis magna at molestie vestibulum. Sed est nunc, mollis at auctor et, pharetra eget felis. Phasellus elementum eget dui sit amet vestibulum. In pellentesque mi eu imperdiet pretium.",
            "Duis blandit mi tellus. In sed lorem nibh. Fusce facilisis quam eu nibh vulputate, id bibendum nisl venenatis. Nam dictum ultrices velit. Sed ut placerat augue. Maecenas sit amet ligula mi. Ut varius efficitur tellus. Duis cursus aliquet convallis. Pellentesque bibendum, turpis vel lobortis fermentum, est metus sagittis diam, maximus hendrerit purus diam a turpis. Praesent pellentesque tortor et quam gravida ullamcorper. Suspendisse semper, lectus a congue interdum, ex massa elementum urna, nec ultricies magna nisi vel turpis.",
            "Aliquam sagittis magna felis, eget convallis diam convallis et. In ut risus ut lorem mollis euismod. Sed finibus augue in lacus imperdiet suscipit. Morbi accumsan urna ullamcorper porttitor egestas. Sed ex tortor, elementum ac imperdiet eu, ullamcorper sit amet mauris. Praesent volutpat sem a iaculis sodales. Fusce gravida sodales arcu laoreet lacinia. In pretium diam quam, sed vestibulum orci ullamcorper vel. Etiam tincidunt massa ipsum. In sollicitudin molestie accumsan. Duis vel lacinia mauris. Sed hendrerit, nibh nec blandit vulputate, ligula dolor auctor nibh, sodales vestibulum ex turpis at lectus."
        ]
    }
    
}
