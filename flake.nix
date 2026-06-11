{
  description = "ROS integration for Franka research robots";

  inputs.gepetto.url = "github:gepetto/nix";

  outputs =
    inputs:
    inputs.gepetto.lib.mkFlakoboros inputs (
      { lib, ... }:
      {
        rosDistros = [
          "humble"
          "jazzy"
        ]; # TODO
        rosShellDistro = "humble"; # TODO
        rosOverrideAttrs.franka-description = {
          src = lib.fileset.toSource {
            root = ./.;
            fileset = lib.fileset.unions [
              ./CMakeLists.txt
              ./end_effectors
              ./env-hooks
              ./launch
              ./meshes
              ./package.xml
              ./robots
              ./rviz
              ./scripts
              ./test
              ./worlds
            ];
          };
        };
      }
    );
}
