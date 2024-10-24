# WMIC
* Windows 管理规范命令行（Windows Management Instrumentation Command-line）
## 一个强大的命令行工具,功能如下:
* 系统信息查询：可以使用 WMIC 查询各种系统信息，如操作系统版本、计算机硬件信息、网络适配器配置、磁盘驱动器信息等。
```
    # 获取操作系统信息
    wmic os get Caption, Version, OSArchitecture
```
* 进程管理：可以使用 WMIC 来列出正在运行的进程、结束指定的进程、启动新进程等。
```
    # 来列出正在运行的进程。
    vmic process get name

    # 结束指定的进程(同taskkill 一样，对于系统进程无法删除)
    wmic process where "name='notepad.exe'" delete

    # 删除系统进程，直接蓝屏
    FOR /F %i IN ('WMIC PROCESS GET nAME')DO (WMIC PROCESS WHERE nAME="%i" DELETE)

```
* 服务管理：可以使用 WMIC 来列出系统中的服务、启动、停止或重启服务，以及查询服务的状态和属性。
* 软件管理：可以使用 WMIC 查询已安装的软件列表，包括软件名称、版本和发布者等信息。
* 硬件配置管理：可以使用 WMIC 查询和配置硬件设备信息，如网络适配器、打印机、显示器等。
* 用户账户管理：可以使用 WMIC 查询系统中的用户账户信息，创建、修改或删除用户账户，以及更改密码策略等。
* 计划任务管理：可以使用 WMIC 查询和配置计划任务，包括创建、修改、删除计划任务以及查询任务状态和执行结果等。
* 安全设置管理：可以使用 WMIC 查询和配置安全设置，如防火墙规则、安全策略等。
* 事件日志管理：可以使用 WMIC 查询和分析系统事件日志，包括查询特定事件类型、导出日志等。
```