# Computer Organization and Architecture Lab1 - ALU

## 简介

本项目是复旦大学《计算机组成原理》课程的第一次实验，旨在使用Verilog HDL设计并实现一个算术逻辑单元（ALU）。ALU 是计算机中央处理单元（CPU）的核心组件，负责执行基本的算术和逻辑运算。

## 功能

本ALU支持以下操作：

- **AND**: 按位与运算
- **OR**: 按位或运算
- **ADD**: 加法运算
- **SUB**: 减法运算
- **NAND**: 按位与非运算
- **NOR**: 按位或非运算
- **SLT**: 小于比较

## 实现细节

ALU定义了32位输入端口 `in1`和 `in2`，3位操作码 `op`，以及32位输出端口 `out`和标志位 `OF`（溢出）、`CF`（进位）、`ZF`（零标志）和 `SF`（符号标志）。定义如下：

```
`define MAX_WIDTH 32
`define OP_WIDTH 3

module alu
(
    input [`MAX_WIDTH - 1:0] in1,
    input [`MAX_WIDTH - 1:0] in2,
    input [`OP_WIDTH - 1:0] op,
    output reg [`MAX_WIDTH - 1:0] out,
    output reg OF, CF, ZF, SF
);
```

因为ALU中的操作均与时钟无关，所以可以采用 `always_comb`直接以组合逻辑实现。具体逻辑使用switch语句即可表示，示例如下：

```verilog
`define AND `OP_WIDTH'b000
`define OR `OP_WIDTH'b001
`define ADD `OP_WIDTH'b010
`define NAND `OP_WIDTH'b100
`define NOR `OP_WIDTH'b101
`define SUB `OP_WIDTH'b110
`define SLT `OP_WIDTH'b111

reg [`MAX_WIDTH:0] temp_out;

assign out = temp_out[`MAX_WIDTH - 1:0];
always_comb
begin
    case (op)
        `AND:
        begin
            temp_out = in1 & in2;
            OF = 0;
            CF = 0;
            ZF = (out == 0);
            SF = temp_out[`MAX_WIDTH - 1];
        end
        `OR:
        begin
            temp_out = in1 | in2;
            OF = 0;
            CF = 0;
            ZF = (out == 0);
            SF = temp_out[`MAX_WIDTH - 1];
        end
        `ADD:
        # 剩余省略
        default:
        begin
            temp_out = 0;
            OF = 0;
            CF = 0;
            ZF = 0;
            SF = 0;
        end
    endcase
end
```
