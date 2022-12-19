#include <cmath>

extern "C" {
    double add(double a, double b) {
        return a + b;
    }

    int factorialPlus(int x){
        return (x == 0) ? 1 : x * factorialPlus(x - 1);
    }
}
