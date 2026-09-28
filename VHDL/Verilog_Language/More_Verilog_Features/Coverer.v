module test;
    bit[3:0] mode;
    bt [1:0] key;

    coverpoint key{

       bins low = {[0:1]};
       bins high = {[2:3]};

    }


endmodule


//with time develop more the notion of the coverer here