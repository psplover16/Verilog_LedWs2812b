module ledgroup_detail (
input clk,
input [7:0] g,
input [7:0] r,
input [7:0] b,
output reg ledLight
// ,output watchColor
);
reg [1:0] nowTH;
reg [1:0] nowTL;

// 要傳輸0
parameter T0H = 2; // 0.4us
parameter T0L = 3;  // 0.85us
// 要傳輸1
parameter T1H = 3;  // 0.85us
parameter T1L = 2;   // 0.4us


wire [23:0] Colors;   // 组合逻辑。wire 的值可以随时变化，不需要时钟触发。它通常用于连接组合逻辑块，例如逻辑门、多路复用器等。
reg [23:0] merged_Color;  // 时序逻辑（sequential logic），即寄存器或存储元件。在时钟的上升沿或下降沿发生变化，用于存储数据

assign Colors = {g,r,b};

// assign watchColor = merged_Color[23];

always @(posedge clk) begin
      if (merged_Color == 0) begin
        merged_Color = Colors;  
      end


  if (nowTH == 0 && nowTL == 0) begin
    if (merged_Color[23] == 0) begin
      nowTH = T0H;
      nowTL = T0L;  
    end else if (merged_Color[23] == 1) begin
      nowTH = T1H;
      nowTL = T1L; 
    end
  end
  if (nowTH > 0) begin
    nowTH = nowTH - 1;
    ledLight = 1;
  end else if (nowTL > 0) begin
    nowTL = nowTL - 1;
    ledLight = 0;
    if (nowTH == 0 && nowTL == 0) begin
      merged_Color = merged_Color << 1;
    end
  end  
end


endmodule