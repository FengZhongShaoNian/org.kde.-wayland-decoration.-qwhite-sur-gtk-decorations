org.kde.WaylandDecoration.QWhiteSurGtkDecorations 
 
Introduction  

A Flatpak plugin that provides WhiteSur-gtk style client-side decorations for Qt applications running through Flatpak.  

**Usage**  
First check which branches of org.kde.Platform runtime are installed on your system using:  

```bash  
flatpak list --runtime --columns=application,branch | grep org.kde.Platform  
```  

Example:  

```  
[someone@hostname~]% flatpak list --runtime --columns=application,branch | grep org.kde.Platform  
org.kde.Platform    5.15-24.08  
```  

As shown above, the "5.15-24.08" branch of the runtime is installed on this machine. Use the corresponding "5.15-24.08" branch of this repository to install the QWhiteSurGtkDecorations plugin for the 5.15-24.08 runtime:  

```bash  
git clone --branch="5.15-24.08" git@gitee.com:fengzhongshaonian/org.kde.-wayland-decoration.-qwhite-sur-gtk-decorations.git  
cd org.kde.-wayland-decoration.-qwhite-sur-gtk-decorations  
./install.sh  
```  

The same approach applies to other branches.