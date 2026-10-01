#include <systemc.h>
using namespace sc_core;


SC_MODULE(counter){

    sc_in_clk     clock ;

    sc_in<bool> clock;
    sc_in<bool> reset;
    sc_in<bool> enable;
   
    sc_in<bool> up,down;

    sc_out<sc_uint<4> > counter_out;

    //local variable
    sc_uint<4>	count;

    //counter implementation
    void incrementer()
    {

        while(true) //infinite loop
        {
            wait();
            if(reset.read() == 1){
                count = 0;
                counter_out.write(count);
            }else if (enable.read() = 1)
            {
                if (up.read() == 1 && down.read() != 1){
                    count = count + 1;
                    counter_out.write(count);
                };

                else if (up.read() != 1 && down.read() ==1 )
                {
                    count  = count -1;
                    counter_out.write(count);
                };

            }
        }
    }

    void print_count()
    {
        while (true)
        {
            wait();
            std::cout << " :: Counter Value "<<counter_out.read()<<endl;
        }
    }


    SC_CTOR(counter)
    {
       SC_CTHREAD(incrementer,clock.pos());
       sensitive << clock.pos(); //synchronous
       reset_signal_is(reset,true);

    };

};

int sc_main(int argc, char* argv[])
{

    sc_signal<bool> clock;
    sc_signal<bool> reset;
    sc_signal<sc_uint<5> > counter_out;

    int i;

    counter first_counter("COUNTER");

    counter.reset(reset);
    counter.clock(clock);
    counter.counter_out(counter_out);


    return 0;
}