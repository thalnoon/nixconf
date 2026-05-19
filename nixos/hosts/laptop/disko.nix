{
    disko.devices = {
      disk = {
          main = {
              type = "disk";
              device = "<INSERT>";
              content = {
                type = "gpt";
                partitions = {

                  esp = {
                    name = "ESP";
                    size = "1G";
                    type = "EF00";
                    content = {
                      type = "filesystem";
                      format = "vfat";
                      mountpoint = "/boot";
                      mountOptions = ["umask=0077"];
                    };
                  };

                  swap = {
                    size = "16G";
                    content = {
                      type = "swap";
                      resumeDevice = true;
                    };
                  };

                  root = {
                    size = "100%";
                    content = {
                      type = "btrfs";
                      extraArgs = ["-f"];
                      subvolumes = {
                        "@" = {
                          mountpoint = "/";
                          mountOptions = ["compress=zstd" "noatime"];
                        };
                        "@home" = {
                          mountpoint = "/home";
                          mountOptions = ["compress=zstd" "noatime"];
                        };
                        "@nix" = {
                          mountpoint = "/nix";
                          mountOptions = ["compress=zstd" "noatime"];
                        };
                        "@log" = {
                          mountpoint = "/var/log";
                          mountOptions = ["compress=zstd" "noatime"];
                        };
                      };
                    };
                  };
                };
              };
            }; 
        };
      };
  }
