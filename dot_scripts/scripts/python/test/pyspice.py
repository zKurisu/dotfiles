#! /usr/bin/python3
#  pyspice.py
#
#  function
#
#  Copyright (Python) Jie
#  2023-02-14
# 

import matplotlib.pyplot as plt
import numpy as np
from PySpice.Spice.Library import SpiceLibrary
from PySpice.Probe.Plot import plot

# 定义电路库
spice_library = SpiceLibrary('lib')

# 定义电路元件
r1 = 100
r2 = 200
c1 = 1e-6

# 定义电路
circuit = spice_library.load_circuit('simple_rc.cir')
circuit.R('1', 'in', 'out', r1)
circuit.R('2', 'out', 'gnd', r2)
circuit.C('1', 'in', 'out', c1)

# 运行仿真
simulator = circuit.simulator(temperature=25, nominal_temperature=25)
analysis = simulator.transient(step_time=1e-6, end_time=0.1)

# 绘制输出波形
figure, axis = plt.subplots()
plot(analysis.out, axis=axis)
plt.show()

