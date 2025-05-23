# org.kde.WaylandDecoration.QWhiteSurGtkDecorations

## 介绍
flatpak插件，用于给flatpak中运行的Qt应用提供符合WhiteSur-gtk风格的客户端装饰。

使用方法：
使用如下命令查看本机安装有那些分支的org.kde.Platform运行时：
```shell
flatpak list --runtime --columns=application,branch | grep org.kde.Platform
```

例如：
```
[someone@hostname~]% flatpak list --runtime --columns=application,branch | grep org.kde.Platform
org.kde.Platform	5.15-24.08
```
如上所示，我的机子安装有"5.15-24.08"这个分支的运行时，所以使用本仓库的"5.15-24.08"分支来为5.15-24.08运行时安装QWhiteSurGtkDecorations插件：
```shell
git clone --branch="5.15-24.08" git@gitee.com:fengzhongshaonian/org.kde.-wayland-decoration.-qwhite-sur-gtk-decorations.git
cd org.kde.-wayland-decoration.-qwhite-sur-gtk-decorations
./install.sh
```

其它分支同理。