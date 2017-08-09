# AndroidTV-AOSP
Definitions for generic x86 Android TV device target
```
  <project path="device/google/atv" name="device/google/atv" groups="device" />

  <remote  name="LineageOS" fetch="https://github.com/LineageOS/" />
  <project path="packages/apps/CMFileManager" name="android_packages_apps_CMFileManager" remote="LineageOS" revision="cm-14.1" />
  <project path="external/uicommon" name="android_external_cyanogen_UICommon" remote="LineageOS" revision="cm-14.1" />

  <remote name="opengapps-fork" fetch="https://github.com/kyvaith/"  />
  <project path="vendor/google/build" name="aosp_build" clone-depth="1" revision="master" remote="opengapps-fork" />
  
  <remote name="opengapps" fetch="https://github.com/opengapps/"  />
  <project path="vendor/opengapps/sources/all" name="all" clone-depth="1" revision="master" remote="opengapps" />
  <project path="vendor/opengapps/sources/x86" name="x86" clone-depth="1" revision="master" remote="opengapps" />
  <project path="vendor/opengapps/sources/x86_64" name="x86_64" clone-depth="1" revision="master" remote="opengapps" />
  ```
