# SNP Implementation for Robotic Blending Milestone 5

This demo uses a Motoman MH180 with an Intel RealSense camera to reconstruct the surface of an arbitrary part and generate motion plans for grinding the part in a raster pattern

## Build Setup

1. Follow the [build setup instructions](https://github.com/ros-industrial-consortium/scan_n_plan_workshop#build-setup) for the main repository


## Build

```
colcon build --cmake-args -DTESSERACT_BUILD_FCL=OFF
```
## Running the system
### Simulation
```bash
ros2 launch snp_blending start.launch.xml
```

### On Hardware
    ```bash
    cd <snp_workspace>
    source install/setup.bash
    ros2 launch snp_blending start.launch.xml sim_robot:=false sim_vision:=false
    ```
