# Flutter Scaffold-X

Flutter Scaffold-X 是一个基于 GetX 框架的强大而高效的 Flutter 脚手架项目。它旨在为 Flutter 开发人员提供一个即插即用的基础，用于构建高质量的移动应用程序。

## 特点

- 集成 GetX，用于状态管理、导航和依赖注入。
- 组织良好的项目结构，有利于代码维护和可扩展性。
- 提供常见移动应用功能的可用模块、页面和小部件。
- 支持国际化和本地化。
- 预配置的资源、字体、主题和实用工具的文件夹结构。
- 可自定义的主题和用户界面组件，以确保应用品牌一致性。
- 示例 API 集成，用于从远程服务器获取数据。
- 代码生成脚本，自动化重复任务。

## 快速入门

按照以下步骤开始使用 Flutter Scaffold-X 创建新项目：

- 克隆仓库：
  ``` bash
  git clone https://github.com/yunlongwen/flutter-scaffold-x.git
  ```

- 安装所需依赖项：
  ```
    flutter pub get
  ```
- 运行项目：
  ```
    flutter run
  ```
  有关如何在开发环境中设置 Flutter 的更多信息，请参阅 Flutter 文档。

## 项目结构

Flutter Scaffold-X 的项目结构采用模块化的方法，促进代码分离和可维护性。以下是主要目录的概述：

- lib：包含应用程序的 Dart 源代码。
  - core                           # 核心模块，包含通用的数据模型、存储库和服务
    - models                       # 存放通用的数据模型
    - repositories                 # 存放通用的数据存储库
    - services                     # 存放通用的服务类
    - utils                        # 存放通用的工具类和函数
  - l10n                           # 本地化字符串，flutter gen-l10n生成和更新
  - features                       # 功能模块目录，包含各个独立的功能模块
    - authentication                # 认证功能模块
      - data                        # 数据层，处理与认证相关的数据
        - models                    # 存放认证相关的数据模型
        - repositories              # 存放认证相关的数据存储库
      - presentation                # 表示层，处理与认证相关的界面逻辑和UI
        - bloc                       # 存放认证的业务逻辑组件（BLoC）
        - pages                      # 存放与认证相关的页面
        - widgets                    # 存放与认证相关的小部件

  - shared                          # 共享模块目录，存放可在不同功能模块间共享的组件和样式
    - widgets                       # 存放共享的小部件
    - styles                        # 存放共享的样式和主题定义

  - main.dart                       # 应用程序的入口文件

## 资料

中文文档: https://flutter.cn/docs