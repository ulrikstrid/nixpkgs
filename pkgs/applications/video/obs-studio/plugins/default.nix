{ callPackage, libsForQt5 }:

{
  obs-droidcam = callPackage ./obs-droidcam.nix { };
  obs-gstreamer = callPackage ./obs-gstreamer.nix { };
  obs-move-transition = callPackage ./obs-move-transition.nix { };
  obs-multi-rtmp = libsForQt5.callPackage ./obs-multi-rtmp.nix { };
  obs-ndi = libsForQt5.callPackage ./obs-ndi.nix { };
  wlrobs = callPackage ./wlrobs.nix { };
}
