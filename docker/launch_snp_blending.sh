#!/bin/bash

source /opt/snp_blending/install/setup.bash
ros2 launch snp_blending start.launch.xml sim_robot:=${SNP_SIM_ROBOT:-false} sim_vision:=${SNP_SIM_VISION:-false} bypass_execution:=${SNP_BYPASS_EXECUTION:-false}
