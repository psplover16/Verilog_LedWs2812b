module ledgroup (
input clk,
output reg led, // 觀察用
output ledLight
// output watchColor
);

parameter r = 8'b01010101;
parameter g = 8'b11100011; // 01010101
parameter b = 8'b11111111;

ledgroup_detail m1 (
  .clk(clk), 
  .g(g),
  .r(r),
  .b(b),
  .ledLight(ledLight)  // 內部reg  外部wire
  );


// http://old.mdy-edu.com/m/view.php?aid=1258

// 【问题45】Error (10663): Verilog HDL Port Connection error at wave.v(31): output or inout port "dataouthc" must be connected to 
// a structural net expression模块例化时数据类型的错误。
// 答：
// 1.输入端口：从模块内部来讲，输入端口必须为线网型（不进行类型声明则默认为wire）；从模块外部来看，输入端口可以连接到线网或reg型的变量。
// 2.输出端口：从模块内部来讲，输出端口可以是线网或reg型；从模块外部来看，输出端口必须连接到线网型的变量。为什么要这样定义，则需要理解fpga的硬件结构。

endmodule