# 8位全加器

## 实验原理

先构建一位全加器，在将8个全加器串起来，低位的进位传送到下一个全加器里。

### 一位全加器的构建

#### 列出真值表 

A,B：加数，Ci：来自低位的进位
Sum：和 ，Co：进位
![](media/15854658365791.png)
#### verilog代码实现

```verilog
module fulladder(Sum,Co,A,B,Ci);
	input A,B,Ci;
	output Sum,Co;
	wire 	S1,S2,S3;
		xor (Sum,A,B,Ci);//构建sum
		and (S1,A,B);
		xor (S2,A,B);
		and	(S3,Ci,S2);
		or  (Co,S1,S3);//构建co
	endmodule
```
### 8位全加器的构建

重复调用1位全加器。

#### verilog代码实现

```verilog
module bitfulladder(Sum,Co,A,B,Ci);
	input [7:0] A,B;
	input Ci;
	output [7:0]Sum,Co;
		fulladder	UO(Sum[0],Co[0],A[0],B[0],Ci);
		fulladder	U1(Sum[1],Co[1],A[1],B[1],Co[0]);
		fulladder 	U2(Sum[2],Co[2],A[2],B[2],Co[1]);
		fulladder	U3(Sum[3],Co[3],A[3],B[3],Co[2]);
		fulladder	U4(Sum[4],Co[4],A[4],B[4],Co[3]);
		fulladder	U5(Sum[5],Co[5],A[5],B[5],Co[4]);
		fulladder	U6(Sum[6],Co[6],A[6],B[6],Co[5]);
		fulladder	U7(Sum[7],Co[7],A[7],B[7],Co[6]);
endmodule
```

## 测试激励文件

#### verilog代码实现


```verilog
`timescale 1ns/1ns
module test_adder;
	reg [7:0]A,B;
	reg Ci;
	wire [7:0]Sum,Co;
	bitfulladder bitadderu(Sum,Co,A,B,Ci);
initial
	begin
		#100 A = 8'b0000_0000; B = 8'b0000_0000; Ci = 1'b0; //0+0=0 
		#100 A = 8'b0000_0001; B = 8'b0000_0001; Ci = 1'b1; //1+1+1=3 
		#100 A = 8'b0010_0000; B = 8'b0010_0011; Ci = 1'b1; //32+35+1=68
		#100 A = 8'b1111_1100; B = 8'b0000_0011; Ci = 1'b0; //252+3+0=255
		#100 A = 8'b1111_1100; B = 8'b0000_0011; Ci = 1'b1; //252+3+1=256
		#100 A = 8'b1111_1100; B = 8'b0000_1000; Ci = 1'b0; //252+8+0=260
		#500 $stop;
	end
initial
	begin
		$monitor($time,"::A,B,Cin=%b%b%b", A,B,Ci,
				":::Cout, Sum=%b%b", Co, Sum);
	end
endmodule				
```
####波形图


![](media/FEA885C3-75D7-4263-B040-3805CA878551.png)

### 结果分析

在运算结果不超过二进制8位（0～255）时，8位全加器运算正常；
若运算结果超过范围，则结果要重新计算表示：co[7]*256+Sum

## debug 过程

调试代码时出现了两个bug
1.全加器构建错误 ，构建了or（co，s2，s3），后波形出来后结果错误，查看波形后发现进位波形与手动计算不同。
2.目标信号大小写问题，最后构建了一个CO的输出，导致一整片蓝色（没有信号）

## 实验改进设想

1.模块化思想，底层描述依靠于电路的构建，而且重复调用模块可能会导致资源浪费，可否采用数据流建模。
### 


