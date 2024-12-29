# Computer Organization and Architecture Lab1 - ALU

## 简介
本项目是复旦大学《计算机组成原理》课程的第一次实验，旨在设计并实现一个算术逻辑单元（ALU）。ALU 是计算机中央处理单元（CPU）的核心组件，负责执行基本的算术和逻辑运算。

## 功能
本ALU支持以下操作：
- **AND**: 按位与运算
- **OR**: 按位或运算
- **ADD**: 加法运算
- **SUB**: 减法运算
- **NAND**: 按位非与运算
- **NOR**: 按位非或运算
- **SLT**: 小于比较

## 实现细节
ALU采用Verilog HDL编写，定义了32位输入端口`in1`和`in2`，3位操作码`op`，以及32位输出端口`out`和标志位`OF`（溢出）、`CF`（进位）、`ZF`（零标志）和`SF`（符号标志）。

### 模块结构
```verilog
module alu (
    input [`MAX_WIDTH - 1:0] in1,
    input [`MAX_WIDTH - 1:0] in2,
    input [`OP_WIDTH - 1:0] op,
    output reg [`MAX_WIDTH - 1:0] out,
    output reg OF, CF, ZF, SF
);

endmodule
