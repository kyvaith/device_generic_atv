# AndroidTV-AOSP
Definitions for generic x86 Android TV device target
```
  <remove-project name="platform/bootable/newinstaller" />
  <remove-project name="platform/packages/apps/BasicSmsReceiver" />
  <remove-project name="platform/packages/apps/Browser2" />
  <remove-project name="platform/packages/apps/Calendar" />
  <remove-project name="platform/packages/apps/Camera2" />
  <remove-project name="platform/packages/apps/CarrierConfig" />
  <remove-project name="platform/packages/apps/CellBroadcastReceiver" />
  <remove-project name="platform/packages/apps/Contacts" />
  <remove-project name="platform/packages/apps/DeskClock" />
  <remove-project name="platform/packages/apps/DevCamera" />
  <remove-project name="platform/packages/apps/Dialer" />
  <remove-project name="platform/packages/apps/DocumentsUI" />
  <remove-project name="platform/packages/apps/Eleven" />
  <remove-project name="platform/packages/apps/Email" />
  <remove-project name="platform/packages/apps/EmergencyInfo" />
  <remove-project name="platform/packages/apps/ExactCalculator" />
  <remove-project name="platform/packages/apps/Gallery2" />
  <remove-project name="platform/packages/apps/HTMLViewer" />
  <remove-project name="platform/packages/apps/Launcher3" />
  <remove-project name="platform/packages/apps/ManagedProvisioning" />
  <remove-project name="platform/packages/apps/Messaging" />
  <remove-project name="platform/packages/apps/OneTimeInitializer" />
  <remove-project name="platform/packages/apps/PackageInstaller" />
  <remove-project name="platform/packages/apps/Phone" />
  <remove-project name="platform/packages/apps/Provision" />
  <remove-project name="platform/packages/apps/QuickSearchBox" />
  <remove-project name="platform/packages/apps/Settings" />
  <remove-project name="platform/packages/apps/StorageManager" />
  <remove-project name="platform/packages/apps/Taskbar" />
  <remove-project name="platform/packages/apps/WallpaperPicker" />
  <remove-project name="platform/packages/inputmethods/LatinIME" />
  <remove-project name="platform/packages/providers/BlockedNumberProvider" />
  <remove-project name="platform/packages/providers/BookmarkProvider" />
  <remove-project name="platform/packages/providers/CallLogProvider" />
  <remove-project name="platform/packages/providers/TelephonyProvider" />
  <remove-project name="platform/packages/screensavers/Basic" />
  <remove-project name="platform/packages/screensavers/PhotoTable" />
  <remove-project name="platform/packages/services/BuiltInPrintService" />
  <remove-project name="platform/packages/services/Mms" />
  <remove-project name="platform/packages/wallpapers/LivePicker" />

  <remote name="kyvaith" fetch="https://github.com/kyvaith/"  />
  <project path="bootable/newinstaller" name="platform_bootable_newinstaller" clone-depth="1" revision="oreo-x86" remote="kyvaith" />
  <project path="vendor/intel/houdini" name="vendor_intel_houdini" clone-depth="1" revision="oreo-x86" remote="kyvaith" />
  <project path="vendor/opengapps/build" name="aosp_build" clone-depth="1" revision="oreo" remote="kyvaith" />
  <project path="vendor/opengapps/sources/all" name="all" clone-depth="1" revision="master" remote="kyvaith" />
  <project path="vendor/opengapps/sources/x86" name="x86" clone-depth="1" revision="master" remote="kyvaith" />
  <project path="device/generic/atv" name="device_generic_atv" clone-depth="1" revision="oreo-x86" remote="kyvaith" />
  ```
