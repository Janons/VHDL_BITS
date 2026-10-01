#include <systemc>
using namespace sc_core;


SC_MODULE (MODULE_A){
    SC_CTOR(MODULE_A){

        std::cout << name() << " constructor" << '\n';
    }
};


int sc_main(int,char*[]){

    MODULE_A module_a("module_a");


}