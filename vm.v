module vendingmc (input clk, input rst, input [2:0] money, output reg [1:0] prod, output reg [3:0] bal);
    reg [1:0] p;
    reg [3:0] ns, ps;
    //reg [26:0] clkd = 27'd0;
    //Now defining all the states of the vending machine.
    parameter [3:0] A=4'b0000;
    parameter [3:0] B=4'b0001;
    parameter [3:0] C=4'b0010;
    parameter [3:0] D=4'b0011;
    parameter [3:0] E=4'b0100;
    parameter [3:0] F=4'b0101;
    parameter [3:0] G=4'b0110;
    parameter [3:0] H=4'b0111;
    parameter [3:0] I=4'b1000;
    parameter [3:0] J=4'b1001;
    parameter [3:0] K=4'b1010;
    parameter [3:0] L=4'b1011;
    parameter [3:0] M=4'b1100;
    parameter [3:0] N=4'b1101;
    parameter [3:0] O=4'b1110;
    parameter [3:0] P=4'b1111;
    initial
    begin
        p = 2'b00;
        bal = 4'd0;
    end
   //always@ (posedge clk)
      // clkd = clkd + 1;
        
    always@ (clk or rst or ns) //Checking the state of the reset button
    begin
        if(rst)
        begin
            bal = ps;
            ps = A;
            ns = A;
            prod = p;
        end
        else
        ps<=ns;
       end
    
    always@ (clk or money or ns)
    begin
    case(ps)
        A: if (money == 3'd1) ns = B;
           else if (money == 3'd2) ns = C;
           else if (money == 3'd5) ns = F;
        B: if (money == 3'd1) ns = C;
           else if (money == 3'd2) ns = D;
           else if (money == 3'd5) ns = G;
        C: if (money == 3'd1) ns = D;
           else if (money == 3'd2) ns = E;
           else if (money == 3'd5) ns = H;
        D: if (money == 3'd1) ns = E;
           else if (money == 3'd2) ns = F;
           else if (money == 3'd5) ns = I;
        E: if (money == 3'd1) ns = F;
           else if (money == 3'd2) ns = G;
           else if (money == 3'd5) ns = J;
        F: if (money == 3'd1) ns = G;
           else if (money == 3'd2) ns = H;
           else if (money == 3'd5) ns = K;
        G: if (money == 3'd1) ns = H;
           else if (money == 3'd2) ns = I;
           else if (money == 3'd5) ns = L;
        H: if (money == 3'd1) ns = I;
           else if (money == 3'd2) ns = J;
           else if (money == 3'd5) ns = M;
        I: if (money == 3'd1) ns = J;
           else if (money == 3'd2) ns = K;
           else if (money == 3'd5) ns = N;
        J: if (money == 3'd1) ns = K;
           else if (money == 3'd2) ns = L;
           else if (money == 3'd5) ns = O;
        default: ns = A;
    endcase
    end
    
    //Following code is to return the balance and product to user.
    
    always@ (clk or ps)
    begin
        case(ps)
        A: begin
                p = p;
           end
        B: begin
                p = p;
           end
        C: begin
                p = p;
           end
        D: begin
                p = p;
           end
        E: begin
                p = p;
           end
        F: begin
                p = p;
           end
        G: begin
                p = p;
           end
        H: begin
                p = p;
           end
        I: begin
                p = p;
           end
        J: begin
                p = p;
           end
        K: begin
                p = p+2'd1;
                ns = A;
           end
        L: begin
                p = p+2'd1;
                ns = B;
           end
        M: begin
                p = p+2'd1;
                ns = C;
                
           end
        N: begin
                p = p+2'd1;
                ns = D;
           end
        O: begin
                p = p+2'd1;
                ns = E;
           end
        P: begin
                p = P+2'd1;
                ns = F;
           end
        default: begin
                    p = 1'b0;
                  end
        endcase
     end
endmodule

