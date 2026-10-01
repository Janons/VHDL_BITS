#include <systemc>
#include <iostream>


using namespace sc_core;

SC_MODULE(hello_world){
    SC_CTOR(hello_world){
        //nothing in the constructor
    }

    void say_hello(){

        cout << "Hello World. \n"
    }
};

//sc_main -> top level
int sc_main(int argc, char* argv[]){

    hello_world hello("HELLO")

    hello.say_hello();

    return(0);



}